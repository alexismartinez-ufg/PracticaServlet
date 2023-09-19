<%-- 
    Document   : index
    Created on : 09-16-2023, 08:17:24 AM
    Author     : Gotow
--%>

<%@page import="Logica.Estudiante"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <div class="container mt-3">
    <div class="row text-center mb-4">
        <h1>PRACTICA SERVLETS</h1>
    </div>
    <div class="row">
        <div class="col-md-4">
        <h2>Datos del Cliente</h2>
        <form action="SvEstudiantes" method="Post">
            <div class="col-md-12">
                <div class="mb-3">
                <label>Nombre del estudiante</label><input type="text" name="nombre" class="form-control">
            </div>
            
            <div class="mb-3">
               <label>Apellidos</label><input type="text" name="apellido" class="form-control">
            </div>
            
            <div class="mb-3">
               <label>Sexo</label><input type="text" name="sexo" class="form-control">
            </div>
            
            <div class="mb-3">
               <label>Numero de Contacto</label><input type="text" name="telefono" class="form-control">
            </div>
            
            <div class="mb-3">
               <label>NIE</label><input type="text" name="nie" class="form-control">
            </div>
            
            <div class="mb-3">
               <label>Municipio de residencia</label><input type="text" name="municipio" class="form-control">
            </div>
            
            <div class="mb-3">
               <label>Nombre del encargado</label><input type="text" name="encargado" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Enviar</button>
            </div>
        </form>
    </div>
        <div class="col-md-8">
            <h2>Lista de Estudiantes</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Sexo</th>
                        <th>Teléfono</th>
                        <th>NIE</th>
                        <th>Municipio</th>
                        <th>Encargado</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Estudiante> estudiantes = (List<Estudiante>) request.getAttribute("estudiantes");
                    if (estudiantes != null) {
                        for (Estudiante estudiante : estudiantes) {
                    %>
                        <tr>
                            <td><%= (estudiante.getNombre() != null) ? estudiante.getNombre() : "" %></td>
                            <td><%= (estudiante.getApellido() != null) ? estudiante.getApellido() : "" %></td>
                            <td><%= (estudiante.getSexo() != null) ? estudiante.getSexo() : "" %></td>
                            <td><%= (estudiante.getTelefono() != null) ? estudiante.getTelefono() : "" %></td>
                            <td><%= (estudiante.getNie() != null) ? estudiante.getNie() : "" %></td>
                            <td><%= (estudiante.getMunicipio() != null) ? estudiante.getMunicipio() : "" %></td>
                            <td><%= (estudiante.getEncargado() != null) ? estudiante.getEncargado() : "" %></td>
                            <td>
                                <form action="EliminarEstudiante" method="post">
                                    <input type="hidden" name="idEstudiante" value="<%= estudiante.getId() %>">
                                    <button type="submit" class="btn btn-danger">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    <%    }
                    }
                    %>
                </tbody>
            </table>
            <a href="SvEstudiantes" class="btn btn-info">Actualizar Lista</a>
        </div>
    </div>
</div>
    </body>
</html>
