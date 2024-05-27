import tensorflow as tf
from tensorflow.keras import layers, models
from tensorflow.keras.datasets import mnist

# Load the MNIST dataset
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
train_images, test_images = train_images / 255.0, test_images / 255.0

# Reshape the data to include the channel dimension
train_images = train_images.reshape((train_images.shape[0], 28, 28, 1))
test_images = test_images.reshape((test_images.shape[0], 28, 28, 1))

# Define the model
model = models.Sequential([
    layers.Flatten(input_shape=(28, 28, 1)),
    layers.Dense(128, activation='relu'),
    layers.Dense(10, activation='softmax')
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Train the model
model.fit(train_images, train_labels, epochs=1)

# Evaluate the model
test_loss, test_acc = model.evaluate(test_images, test_labels)
print(f'Test accuracy: {test_acc}')

# Convert the model to TensorFlow Lite format
converter = tf.lite.TFLiteConverter.from_keras_model(model)
converter.optimizations = [tf.lite.Optimize.DEFAULT]
tflite_model = converter.convert()

# Save the quantized model
with open('mnist_model_quantized.tflite', 'wb') as f:
    f.write(tflite_model)
import numpy as np
import nngen as ng

# Load the TFLite model
interpreter = tf.lite.Interpreter(model_path='mnist_model_quantized.tflite')
interpreter.allocate_tensors()

input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

input_shape = input_details[0]['shape']
input_dtype = ng.int16
output_dtype = ng.int16

# Define NNgen placeholders
input_layer = ng.placeholder(dtype=input_dtype, shape=(1, 28, 28, 1), name='input_layer')

# Define NNgen model structure
w0 = ng.variable(dtype=ng.int16, shape=(32, 3, 3, 1), name='w0')
b0 = ng.variable(dtype=ng.int16, shape=(32,), name='b0')
s0 = ng.variable(dtype=ng.int16, shape=(32,), name='s0')
a0 = ng.conv2d(input_layer, w0, strides=(1, 1, 1, 1), bias=b0, scale=s0, act_func=ng.relu, sum_dtype=ng.int64)
a0p = ng.max_pool_serial(a0, ksize=(1, 2, 2, 1), strides=(1, 2, 2, 1))

# Flatten and dense layers
a0_flat = ng.reshape(a0p, [1, -1])
w1 = ng.variable(dtype=ng.int16, shape=(128, a0_flat.shape[-1]), name='w1')
b1 = ng.variable(dtype=ng.int16, shape=(128,), name='b1')
s1 = ng.variable(dtype=ng.int16, shape=(128,), name='s1')
a1 = ng.matmul(a0_flat, w1, bias=b1, scale=s1, transposed_b=True, act_func=ng.relu, sum_dtype=ng.int64)

w2 = ng.variable(dtype=ng.int16, shape=(10, a1.shape[-1]), name='w2')
b2 = ng.variable(dtype=ng.int16, shape=(10,), name='b2')
s2 = ng.variable(dtype=ng.int16, shape=(10,), name='s2')
output_layer = ng.matmul(a1, w2, bias=b2, scale=s2, transposed_b=True, name='output_layer', sum_dtype=ng.int64)

# Assign random weights (replace with actual quantized values)
def assign_random_weights(var):
    value = np.random.normal(size=var.length).reshape(var.shape)
    value = np.clip(value, -5.0, 5.0)
    value = value * (2.0 ** (var.dtype.width - 1) - 1) / 5.0
    value = np.round(value).astype(np.int64)
    var.set_value(value)

for var in [w0, b0, s0, w1, b1, s1, w2, b2, s2]:
    assign_random_weights(var)

# Quantize the model
ng.quantize([output_layer], {'input_layer': 128})

# Convert to Verilog HDL
targ = ng.to_veriloggen([output_layer], 'mnist_model', silent=False, config={'maxi_datawidth': 32})
verilog_code = ng.to_verilog([output_layer], 'mnist_model', silent=False, config={'maxi_datawidth': 32})

# Save the Verilog code
with open('mnist_model.v', 'w') as f:
    f.write(verilog_code)

print('Verilog code has been saved to mnist_model.v')

# Save parameter data for simulation or FPGA use
param_data = ng.export_ndarray([output_layer], chunk_size=64)
np.save('mnist_model.npy', param_data)
print('Parameter data has been saved to mnist_model.npy')

