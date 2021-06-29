import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Float firstOperand = Float.parseFloat(request.getParameter("first-Operand"));
        Float secondOperand = Float.parseFloat(request.getParameter("second-Operand"));
        String operator = request.getParameter("Operator");
        PrintWriter writer =response.getWriter();
float result = 0 ;
try {
switch (operator){
    case "+":
        result = firstOperand+secondOperand;
        break;
    case "-":
        result = firstOperand-secondOperand;
        break;
    case "*":
        result = firstOperand*secondOperand;
        break;
    case "/":
        if (secondOperand ==0){
            throw new Exception("With division, second operand not equal 0 ");
        }
        result = firstOperand/secondOperand;

}
    writer.println("<html>");
writer.println("<h1>RESULT: </h1>");
    writer.println(firstOperand + " " + operator + " " + secondOperand + " = " + result);
    writer.println("</html>");
} catch (Exception e) {
    writer.println("Error: " + e.getMessage());
}
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
