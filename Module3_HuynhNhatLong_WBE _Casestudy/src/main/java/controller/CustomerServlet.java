package controller;

import model.bean.users.Customer;
import model.service.CustomerService;
import model.service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "create":
                try {
                    addNewCustomer(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                try {
                    editCustomer(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                try {
                    deleteCustomer(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
      int id= Integer.parseInt(request.getParameter("id"));
      customerService.deleteCustomer(id);
      showListCustomer(request,response);
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        int idLoaiKhach = Integer.parseInt(request.getParameter("idloaikhach"));
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String date =  request.getParameter("date");
        String card =  request.getParameter("card");
        String phone =  request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id,name,date,card,phone,email,idLoaiKhach,address);
        customerService.updateCustomer(customer);
        showListCustomer(request,response);
    }

    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
      int idLoaiKhach = Integer.parseInt(request.getParameter("idloaikhach"));
       String name = request.getParameter("name");
      String date =  request.getParameter("date");
      String card =  request.getParameter("card");
      String phone =  request.getParameter("phone");
       String email = request.getParameter("email");
       String address = request.getParameter("address");
       Customer customer = new Customer(name,date,card,phone,email,idLoaiKhach,address);
       customerService.addNewCustomer(customer);
       showListCustomer(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action = request.getParameter("action");
if (action==null){
    action = "";
}
switch (action){
    case "create":
        showFormCreate(request,response);
        break;
    case "edit":
        try {
            showFormEditCustomer(request,response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        break;
    case "search":
showCustomer(request,response);
        break;
    default:
        showListCustomer(request,response);
}
    }

    private void showCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String name =  request.getParameter("name");
     List<Customer> list = customerService.searchCustomerByName(name);
     request.setAttribute("list",list);
     RequestDispatcher dispatcher = request.getRequestDispatcher("customer/search.jsp");
     dispatcher.forward(request,response);

    }

    private void showFormEditCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
      int id = Integer.parseInt(request.getParameter("id"));
       Customer customer= customerService.getCustomerById(id);
       request.setAttribute("customer",customer);
       RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
       dispatcher.forward(request,response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("customer/createCustomer.jsp");
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Customer> customerList = customerService.selectAllCustomerList();
        request.setAttribute("list",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/listCustomer.jsp");
        requestDispatcher.forward(request,response);
    }
}
