
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 20px;
        }
        .calculator {
            display: inline-block;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background: #f9f9f9;
        }
        input, select, button {
            margin: 10px 0;
            padding: 10px;
            font-size: 16px;
        }
        .result {
            margin-top: 20px;
            font-size: 20px;
            color: #333;
        }
    </style>
</head>
<body>
    <h1>Simple Calculator</h1>
    <div class="calculator">
        <label for="num1">Number 1:</label>
        <input type="number" id="num1" placeholder="Enter first number"><br>

        <label for="num2">Number 2:</label>
        <input type="number" id="num2" placeholder="Enter second number"><br>

        <label for="operation">Operation:</label>
        <select id="operation">
            <option value="add">Add</option>
            <option value="subtract">Subtract</option>
            <option value="multiply">Multiply</option>
            <option value="divide">Divide</option>
        </select><br>

        <button onclick="calculate()">Calculate</button>

        <div class="result" id="result"></div>
    </div>

    <script>
        function calculate() {
            const num1 = parseFloat(document.getElementById("num1").value);
            const num2 = parseFloat(document.getElementById("num2").value);
            const operation = document.getElementById("operation").value;
            const resultElement = document.getElementById("result");

            if (isNaN(num1) || isNaN(num2)) {
                resultElement.textContent = "Please enter valid numbers.";
                return;
            }

            let result;
            switch (operation) {
                case "add":
                    result = num1 + num2;
                    break;
                case "subtract":
                    result = num1 - num2;
                    break;
                case "multiply":
                    result = num1 * num2;
                    break;
                case "divide":
                    if (num2 === 0) {
                        resultElement.textContent = "Cannot divide by zero.";
                        return;
                    }
                    result = num1 / num2;
                    break;
                default:
                    resultElement.textContent = "Invalid operation.";
                    return;
            }

            resultElement.textContent = `Result: ${result}`;
        }
    </script>
</body>
</html>

