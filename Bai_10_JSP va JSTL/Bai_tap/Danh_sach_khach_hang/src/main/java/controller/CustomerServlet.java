package controller;

import model.bean.Customer;


import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "CustomerServlet",urlPatterns = {"","/customer"})
public class CustomerServlet extends javax.servlet.http.HttpServlet {
    private static List<Customer> customerList;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Van Hoang","20-08-1984","Ha Noi","images.jpg"));
        customerList.add(new Customer("Mai Van A","20-02-1984","Da Nang","images 2.jpg"));
        customerList.add(new Customer("Mai Van B","21-08-1984","Ho Chi Minh","images 3.jpg"));
        customerList.add(new Customer("Mai Van C","20-08-1994","Hai Phong","images 4.jpg"));
    }
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/list.jsp");
        requestDispatcher.forward(request,response);
    }
}
