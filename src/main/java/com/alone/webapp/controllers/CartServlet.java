package com.alone.webapp.controllers;

import com.alone.webapp.DAO.DetalleOrdenDAO;
import com.alone.webapp.DAO.OrdenDAO;
import com.alone.webapp.DAO.ProductoDAO;
import com.alone.webapp.DAO.UsuarioDAO;
import com.alone.webapp.models.Producto;
import com.alone.webapp.models.Usuario;
import com.alone.webapp.util.Util;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {

    private ProductoDAO productoDAO = new ProductoDAO();
    private OrdenDAO ordenDAO = new OrdenDAO();
    private DetalleOrdenDAO detalleOrdenDAO = new DetalleOrdenDAO();
    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        if (action == null) {
            UsuariosServlet.sendError(response);
            return;
        }

        switch (action) {
            case "find":
                try {
                    out.print(this.sendProductJson(request));
                } catch (SQLException | ClassNotFoundException e) {
                    ProductosServlet.sendInternalError(response, e);
                }
                break;
            case "view":
                try {
                    this.redirectToCart(request, response);
                } catch (SQLException | ClassNotFoundException e) {
                    ProductosServlet.sendInternalError(response, e);
                }
                break;
            default:
                UsuariosServlet.sendError(response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        if (action == null) {
            UsuariosServlet.sendError(response);
            return;
        }

        switch (action) {
            case "payment":
                try {
                    out.print(this.confirmPayment(request, ordenDAO, detalleOrdenDAO, usuarioDAO, productoDAO));
                } catch (SQLException | ClassNotFoundException e) {
                    ProductosServlet.sendInternalError(response, e);
                }
                break;
            default:
                UsuariosServlet.sendError(response);
                break;
        }
    }

    private String sendProductJson(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        int id = UsuariosServlet.getId(request);
        Producto producto = productoDAO.findById(id);
        producto.setCantidad(1);

        Gson gson = new GsonBuilder()
                .excludeFieldsWithoutExposeAnnotation()
                .create();

        return gson.toJson(producto);
    }

    private void redirectToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        getServletContext().getRequestDispatcher("/WEB-INF/user/cart/cart.jsp").forward(request, response);
    }

    private String confirmPayment(HttpServletRequest request, OrdenDAO ordenDAO, DetalleOrdenDAO detalleOrdenDAO, UsuarioDAO usuarioDAO, ProductoDAO productoDAO) throws SQLException, ClassNotFoundException, IOException {
        Usuario usuario;

        try {
            usuario = Util.getSessionUser(request);
        } catch (Exception e) {
            return "false";
        }

        // Obtiene el tipo de objeto del arrayList de productos
        final Type productsListType = new TypeToken<ArrayList<Producto>>(){}.getType();

        // Convierte el JSON en un objeto Java utilizando Gson
        Gson gson = new Gson();
        ArrayList<Producto> productos = gson.fromJson(Util.getRequestBody(request), productsListType);

        // Se hace una orden por cada objeto
        for (Producto producto : productos) {
            if (!OrdenServlet.paymentWentGood(
                    productoDAO,
                    usuarioDAO,
                    ordenDAO,
                    detalleOrdenDAO,
                    usuario.getId(),
                    producto.getId(),
                    producto.getCantidad())) {

                return "false";
            }
        }

        return "true";
    }
}
