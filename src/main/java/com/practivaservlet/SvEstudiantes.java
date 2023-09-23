
package com.practivaservlet;

import Logica.Controladora;
import Logica.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvEstudiantes", urlPatterns = {"/SvEstudiantes"})
public class SvEstudiantes extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvEstudiantes</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvEstudiantes at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String estudianteId = request.getParameter("estudianteId");
                
        if(estudianteId != null && estudianteId != "" ){
            Estudiante estudianteToEdit = control.ObtenerUsuarioById(Integer.parseInt(estudianteId));    
            request.setAttribute("estudianteToEdit", estudianteToEdit);
        }

        
        List<Estudiante> estudiantes = control.ObtenerEstudiantes();
        request.setAttribute("estudiantes", estudiantes);
        
        System.out.println("Entro al doGet");
        System.out.println("Cantidad de usuarios devueltos: "+estudiantes.size());

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("REQUEST => "+request.getParameter("nombre"));
        
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

        control.CrearEstudiante(estudiante);
        System.out.println("Se agrego usuario: "+estudiante.getNombre());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
