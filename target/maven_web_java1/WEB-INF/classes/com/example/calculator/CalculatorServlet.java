
package com.example.calculator;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            double num1 = Double.parseDouble(request.getParameter("num1"));
            double num2 = Double.parseDouble(request.getParameter("num2"));
            String operation = request.getParameter("operation");
            double result = 0;

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
                    if (num2 != 0) {
                        result = num1 / num2;
                    } else {
                        response.getWriter().println("<h3>Error: Division by zero is not allowed.</h3>");
                        return;
                    }
                    break;
                default:
                    response.getWriter().println("<h3>Error: Invalid operation.</h3>");
                    return;
            }

            response.getWriter().println("<h2>Calculation Result</h2>");
            response.getWriter().println("<p>Number 1: " + num1 + "</p>");
            response.getWriter().println("<p>Number 2: " + num2 + "</p>");
            response.getWriter().println("<p>Operation: " + operation + "</p>");
            response.getWriter().println("<p>Result: " + result + "</p>");
        } catch (NumberFormatException e) {
            response.getWriter().println("<h3>Error: Please enter valid numbers.</h3>");
        }
    }
}

