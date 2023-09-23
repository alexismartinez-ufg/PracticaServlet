
package com.practivaservlet;

import Logica.Controladora;
import Logica.Estudiante;
import Persistencia.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "EditarEstudiante", urlPatterns = {"/EditarEstudiante"})
public class EditarEstudiante extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditarEstudiante</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditarEstudiante at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        String idusuario = request.getParameter("idEstudianteEdit");
        
         Estudiante estu = control.ObtenerUsuarioById(Integer. parseInt(idusuario));
         
         if(estu!=null){
             HttpSession session = request.getSession();
             session.setAttribute("estudianteToEdit", estu);
             System.out.println("NOMBRE A EDITAR =>  "+estu.getNombre());
             System.out.println("ID A EDITAR =>  "+estu.getId());
         }
         
         System.out.println("SE SALIO DLE DOPOST DE EDITARESTUDIANTE");
         
         System.out.println("VALOOOR DE SEXO => "+ estu.getSexo().getClass());
         
         response.sendRedirect("editar.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("idEstudiante");
          String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String sexo = request.getParameter("sexo");
        String telefono = request.getParameter("telefono");
        String municipio = request.getParameter("municipio");
        String encargado = request.getParameter("encargado");
        String nie = request.getParameter("nie");
        
        System.out.println("NOMBRE => "+nombre);

        Estudiante estudiante = new Estudiante();
        estudiante.setNombre(nombre);
        estudiante.setApellido(apellido);
        estudiante.setSexo(sexo);
        estudiante.setTelefono(telefono);
        estudiante.setMunicipio(municipio);
        estudiante.setEncargado(encargado);
        estudiante.setNie(nie);
        estudiante.setId(Integer.parseInt(id));
        
        System.out.println("VAMOS A EDITAR "+estudiante.getId());
        
        try {
            control.EditarEstudiante(estudiante);
        } catch (Exception ex) {
            Logger.getLogger(EditarEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("SvEstudiantes");

    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
