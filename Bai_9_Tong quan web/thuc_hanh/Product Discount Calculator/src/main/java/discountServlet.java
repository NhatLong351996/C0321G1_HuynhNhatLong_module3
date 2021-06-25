import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "discountServlet",urlPatterns = "/display-discount")
public class discountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String productDescription = request.getParameter("Product-Description");
       int listPrice = Integer.parseInt(request.getParameter("List-Price"));
        int discountPercent = Integer.parseInt(request.getParameter("Discount-Percent"));
        int discountAmount = (int) (listPrice*discountPercent*0.01);
       int discountPrice = listPrice-discountAmount;
       PrintWriter writer= response.getWriter();
       writer.println("<html>");
        writer.println("<h1>"+productDescription+"</h1>");
        writer.println("<h1>Discount Amount: "+discountAmount+"</h1>");
        writer.println("<h1>Discount Price: "+discountPrice+"</h1>");
        writer.println("<html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
