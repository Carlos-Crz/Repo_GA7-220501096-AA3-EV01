/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.supermarkethibernate.servlets;

import com.supermarkethibernate.model.Usuario;
import com.supermarkethibernate.service.UsuarioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private final UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreUsuario = request.getParameter("nombre-usuario");
        String contrasenia = request.getParameter("contrasenia");

        Usuario usuario = usuarioService.autenticarUsuario(nombreUsuario, contrasenia);

        if (usuario != null) {
            request.getSession().setAttribute("usuario", usuario);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("index.jsp?error=1");
        }
    }
}
