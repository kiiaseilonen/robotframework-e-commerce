# E-Commerce Test Automation

## Overview

This automation project is designed to test the following e-commerce features:

- Logging in to the website.
- Adding products to the cart.
- Viewing and verifying the contents of the cart.
- Removing products from the cart.
- Completing an order.

The tests are written using the Robot Framework, with SeleniumLibrary used for interacting with the web interface.

## Requirements

To run the tests, you need the following:

- **Python**
- **Robot Framework**
- **SeleniumLibrary**
- **WebDriver**: Depending on the browser you choose, download the appropriate WebDriver and ensure it is available in your system's PATH.

## Installation

1. **Clone the repository to your local machine:**
    ```sh
   git clone https://github.com/kiiaseilonen/robotframework-e-commerce.git
   cd robotframework-e-commerce
   ```

2. **Install Python Dependencies**
   ```sh
    pip install robotframework
    pip install robotframework-seleniumlibrary
   ```

3. **Set Up WebDriver**

## Usage
Run the tests using the Robot Framework command line:
 ```sh
robot e-commerce.robot
```
After running the tests, view the results in the generated log.html, output.xml, and report.html files.

