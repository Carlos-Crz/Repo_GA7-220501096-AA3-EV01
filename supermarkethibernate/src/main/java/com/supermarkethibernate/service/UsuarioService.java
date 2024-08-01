/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.supermarkethibernate.service;

import com.supermarkethibernate.config.HibernateUtil;
import com.supermarkethibernate.model.Usuario;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UsuarioService {
    
    // Autenticar usuario
    public Usuario autenticarUsuario(String nombreUsuario, String contrasenia) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Usuario usuario = null;
        try {
            String hql = "FROM Usuario WHERE nombre_usuario = :nombreUsuario AND contrasenia = :contrasenia";
            Query query = session.createQuery(hql);
            query.setParameter("nombreUsuario", nombreUsuario);
            query.setParameter("contrasenia", contrasenia);
            usuario = (Usuario) query.uniqueResult();
        } finally {
            session.close();
        }
        return usuario;
    }
    
    // Crear un nuevo usuario
    public void crearUsuario(String ndocumento, String nombre, String apellido, String nombreUsuario, String contrasenia) {
           Session session = HibernateUtil.getSessionFactory().openSession();
           Transaction transaction = null;
           try {
               transaction = session.beginTransaction();
               Usuario usuario = new Usuario();
               usuario.setNdocumento(ndocumento);
               usuario.setNombre(nombre);
               usuario.setApellido(apellido);
               usuario.setNombreUsuario(nombreUsuario);
               usuario.setContrasenia(contrasenia);
               session.save(usuario);
               transaction.commit();
           } catch (Exception e) {
               if (transaction != null) transaction.rollback();
               e.printStackTrace();
           } finally {
               session.close();
           }
       }


    // Obtener todos los usuarios
    public List<Usuario> getAllUsuarios() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Usuario> usuarios = null;
        try {
            String hql = "FROM Usuario";
            Query<Usuario> query = session.createQuery(hql, Usuario.class);
            usuarios = query.list();
        } finally {
            session.close();
        }
        return usuarios;
    }

    // Obtener un usuario por ID
    public Usuario obtenerUsuarioPorId(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Usuario usuario = null;
        try {
            usuario = session.get(Usuario.class, id);
        } finally {
            session.close();
        }
        return usuario;
    }

    // Actualizar un usuario
    public void actualizarUsuario(int id, String ndocumento, String nombre, String apellido, String nombreUsuario, String contrasenia) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Usuario usuario = session.get(Usuario.class, id);
            if (usuario != null) {
                usuario.setNdocumento(ndocumento);
                usuario.setNombre(nombre);
                usuario.setApellido(apellido);
                usuario.setNombreUsuario(nombreUsuario);
                usuario.setContrasenia(contrasenia);
                session.update(usuario);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Eliminar un usuario por ID
    public void eliminarUsuario(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Usuario usuario = session.get(Usuario.class, id);
            if (usuario != null) {
                session.delete(usuario);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

        // Contar todos los usuarios
    public long countUsuarios() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Long count = null;
        try {
            String hql = "SELECT COUNT(*) FROM Usuario";
            Query<Long> query = session.createQuery(hql, Long.class);
            count = query.uniqueResult();
        } finally {
            session.close();
        }
        return count != null ? count : 0;
    }

}