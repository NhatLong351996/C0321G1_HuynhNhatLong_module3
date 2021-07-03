package controller;

import model.bean.Produce;
import model.service.ProduceService;
import model.service.ProduceServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

    @WebServlet(name = "ProduceServlet",urlPatterns = {"","/Products"})
public class ProduceServlet extends HttpServlet {
    ProduceService produceService = new ProduceServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action == null){
            action="";
        }
        switch (action){
            case "create":
                try {
                    addNewProduct(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                try {
                    upDateProduct(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "findByName":
                try {
                    informationForm(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;

        }
    }

        private void informationForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        List<Produce> list= produceService.findProduce(name);
        request.setAttribute("list",list);
        RequestDispatcher dispatcher=request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request,response);
        }

        private void upDateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
            Produce produce = new Produce(id,name,price,description,producer);
            produceService.editProduce(produce);
            showListAllProduct(request,response);
        }

        private void addNewProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
       String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Produce produce = new Produce(name,price,description,producer);
        produceService.insertProduce(produce);
        showListAllProduct(request,response);
        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action =request.getParameter("action");
if (action == null){
    action="";
}
switch (action){
    case "create":
        showFormCreat(request,response);
        break;
    case "edit":
        try {
            showFormEdit(request,response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        break;
    case "delete":
        try {
            deleteProduct(request,response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        break;
    case "findByName":
        showFormByName(request,response);
        break;
    default:
        try {
            showListAllProduct(request,response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
}
    }

        private void showFormByName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("product/find.jsp");
        }

        private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        produceService.deleteProduce(id);
        showListAllProduct(request,response);
        }

        private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produce produce = produceService.selectProduce(id);
        request.setAttribute("product",produce);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        dispatcher.forward(request,response);
        }

        private void showFormCreat(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("product/creat.jsp");
        }

        private void showListAllProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
       List<Produce> produceList = produceService.selectAllProduce();
       request.setAttribute("list",produceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request,response);
    }
}
