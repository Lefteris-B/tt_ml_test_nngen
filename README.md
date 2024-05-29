# Handwritten Digit Recognition and ASIC Conversion

This project trains a neural network to recognize handwritten digits using the MNIST dataset, quantizes the trained network for better performance on resource-constrained devices, and then converts the quantized model to Verilog HDL for ASIC production using NNgen.

## Table of Contents

- [Overview](#overview)
- [Toolflow](#toolflow)
- [Requirements](#requirements)
- [Setup and Usage](#setup-and-usage)
- [Code Explanation](#code-explanation)
- [Contributing](#contributing)
- [License](#license)

## Overview

The goal of this project is to create a custom Application Specific Integrated Circuit (ASIC) for handwritten digit recognition. The process involves training a neural network using TensorFlow, quantizing the network, and converting it to Verilog HDL using NNgen for ASIC production.

## Toolflow

1. **Train Neural Network**: Train a neural network using the MNIST dataset in TensorFlow.
2. **Convert Model to ONNX**: Convert the trained TensorFlow model to the ONNX format.
3. **Quantize Model**: Quantize the ONNX model to integer values suitable for hardware implementation.
4. **NNgen Conversion**: Use NNgen to convert the quantized model to Verilog HDL.
5. **Verilog HDL Generation**: Generate the Verilog HDL code for ASIC production.

## Requirements

- Python 3.x
- TensorFlow
- ONNX
- NNgen
- NumPy
- tf2onnx

## Setup and Usage

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/handwritten-digit-recognition-asic.git
    cd handwritten-digit-recognition-asic
    ```

2. Install the required Python packages:
    ```bash
    pip install tensorflow onnx nngen numpy tf2onnx
    ```

3. Run the script:
    ```bash
    python convert_to_verilog.py
    ```

## Code Explanation

### Training the Neural Network

The script uses TensorFlow to train a neural network on the MNIST dataset, which consists of handwritten digits. The network architecture includes two hidden dense layers with ReLU activation.

### Converting the Model to ONNX

After training, the script converts the TensorFlow model to ONNX format using the `tf2onnx` package.

### Quantizing the Model

The ONNX model is modified to ensure all dimensions are explicitly set, and the script quantizes the weights to integer values suitable for hardware implementation.

### NNgen Conversion

The neural network is defined in NNgen using the quantized weights. NNgen is used to convert the model to Verilog HDL.

### Verilog HDL Generation

The generated Verilog HDL code is saved to a file, which can be used for ASIC production.

## License

Apache v2.0

