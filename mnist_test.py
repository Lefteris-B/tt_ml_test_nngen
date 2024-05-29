import tensorflow as tf
from tensorflow.keras.datasets import mnist
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.keras.utils import to_categorical

# Load MNIST dataset
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

# One-hot encode the labels
y_train = to_categorical(y_train, 10)
y_test = to_categorical(y_test, 10)

# Define the model
model = Sequential([
    Flatten(input_shape=(28, 28)),
    Dense(128, activation='relu'),
    Dense(64, activation='relu'),
    Dense(10)  # Remove the softmax layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='categorical_crossentropy',
              metrics=['accuracy'])

# Train the model
model.fit(x_train, y_train, epochs=1, batch_size=32, validation_data=(x_test, y_test))

# Evaluate the model
loss, accuracy = model.evaluate(x_test, y_test)
print(f'Accuracy: {accuracy}')

# Save the model
model.save('mnist_model_no_softmax.h5')

import onnx
import numpy as np

# Load the ONNX model
onnx_model = onnx.load('mnist_model_no_softmax.onnx')

# Inspect the model graph
print(onnx.helper.printable_graph(onnx_model.graph))

# Ensure all dimensions are explicitly set and modify `Gemm` nodes if necessary
for node in onnx_model.graph.node:
    if node.op_type == 'Gemm':
        # Ensure input tensors have defined shapes
        for input in node.input:
            input_tensor = [tensor for tensor in onnx_model.graph.initializer if tensor.name == input]
            if input_tensor:
                tensor = input_tensor[0]
                if len(tensor.dims) == 0:
                    tensor.dims.extend([1])  # Set shape to scalar if it's empty

# Save the modified ONNX model
onnx.save(onnx_model, 'modified_mnist_model_no_softmax.onnx')
print("Modified ONNX model saved as modified_mnist_model_no_softmax.onnx")

import onnx
import numpy as np

# Load the ONNX model
onnx_model = onnx.load('mnist_model_no_softmax.onnx')

# Inspect the model graph
print(onnx.helper.printable_graph(onnx_model.graph))

# Ensure all dimensions are explicitly set and modify `Gemm` nodes if necessary
for initializer in onnx_model.graph.initializer:
    if len(initializer.dims) == 0:
        initializer.dims.extend([1])

for node in onnx_model.graph.node:
    if node.op_type == 'Gemm':
        for input_name in node.input:
            input_tensor = next((tensor for tensor in onnx_model.graph.initializer if tensor.name == input_name), None)
            if input_tensor and len(input_tensor.dims) == 0:
                input_tensor.dims.extend([1])

# Save the modified ONNX model
onnx.save(onnx_model, 'modified_mnist_model_no_softmax.onnx')
print("Modified ONNX model saved as modified_mnist_model_no_softmax.onnx")

import nngen as ng
import numpy as np

# Data types
act_dtype = ng.int16
weight_dtype = ng.int16
bias_dtype = ng.int16
scale_dtype = ng.int16

# Input
input_layer = ng.placeholder(dtype=act_dtype, shape=(1, 28, 28, 1), name='input_layer')  # Added channel dimension

# Flatten the input
input_flattened = ng.reshape(input_layer, (1, 784), name='input_flattened')

# Layer 1: Dense (784 -> 128), ReLU
w0 = ng.variable(dtype=weight_dtype, shape=(784, 128), name='w0')  # Changed to (784, 128)
b0 = ng.variable(dtype=bias_dtype, shape=(128,), name='b0')

dense1 = ng.matmul(input_flattened, w0, bias=b0, act_func=ng.relu, name='dense1')

# Layer 2: Dense (128 -> 64), ReLU
w1 = ng.variable(dtype=weight_dtype, shape=(128, 64), name='w1')
b1 = ng.variable(dtype=bias_dtype, shape=(64,), name='b1')

dense2 = ng.matmul(dense1, w1, bias=b1, act_func=ng.relu, name='dense2')

# Layer 3: Dense (64 -> 10)
w2 = ng.variable(dtype=weight_dtype, shape=(64, 10), name='w2')
b2 = ng.variable(dtype=bias_dtype, shape=(10,), name='b2')

output_layer = ng.matmul(dense2, w2, bias=b2, name='output_layer')

# Quantize weights
def quantize_variable(var, weight_dtype):
    value = np.random.normal(size=var.length).reshape(var.shape)
    value = np.clip(value, -5.0, 5.0)
    value = value * (2.0 ** (weight_dtype.width - 1) - 1) / 5.0
    value = np.round(value).astype(np.int64)
    var.set_value(value)

quantize_variable(w0, weight_dtype)
quantize_variable(b0, bias_dtype)
quantize_variable(w1, weight_dtype)
quantize_variable(b1, bias_dtype)
quantize_variable(w2, weight_dtype)
quantize_variable(b2, bias_dtype)

# Define hardware attributes
for op in [dense1, dense2, output_layer]:
    op.attribute(par_ich=2, par_och=2, cshamt_out=weight_dtype.width + 1)

# Convert to Verilog
silent = False
axi_datawidth = 32

verilog_gen = ng.to_veriloggen([output_layer], 'mnist_model', silent=silent, config={'maxi_datawidth': axi_datawidth})

# Generate the Verilog HDL code as a string
verilog_code = verilog_gen.to_verilog()

# Save the Verilog code to a file
with open('mnist_model.v', 'w') as f:
    f.write(verilog_code)

print("Verilog model saved as mnist_model.v")
