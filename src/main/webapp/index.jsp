<%-- 
    Document   : index
    Created on : 09-16-2023, 08:17:24 AM
    Author     : Gotow
--%>

<%@page import="Logica.Estudiante"%>
<%@page import="Logica.Controladora"%>
<%@page import="java.util.List"%>
<% 
    Controladora control = new Controladora();
    List<Estudiante> _estudiantes =  control.ObtenerEstudiantes();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="js/jquery.mask.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert@1/dist/sweetalert.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert@1/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <div class="container mt-3">
            <div id="overlay" class="overlay"></div>
            <div id="loader" class="loader"></div>

            <div class="row text-center mb-4">
                <h1>PRACTICA SERVLETS</h1>
            </div>
            
            <% 
                
                Estudiante estudianteToEdit = (Estudiante) request.getAttribute("estudianteToEdit");
                
                String nombre = "";
                String apellido = "";
                String hombre = "";
                String mujer = "";
                String otro = "";
                String telefono = "";
                String nie = "";
                String municipio = "";
                String encargado = "";
                String sexo = "";

                if (estudianteToEdit != null) {
                    sexo = estudianteToEdit.getSexo();
                    nombre = estudianteToEdit.getNombre();
                    apellido = estudianteToEdit.getApellido();
                    hombre = sexo == "Masculino" ? "checked" : "";
                    mujer = sexo == "Femenino" ? "checked" : "";
                    otro = sexo == "Otro" ? "checked" : "";
                    telefono = estudianteToEdit.getTelefono();
                    nie = estudianteToEdit.getNie();
                    municipio = estudianteToEdit.getMunicipio();
                    encargado = estudianteToEdit.getEncargado();
                }
            %>
        
            <div class="row">
                <div class="col-md-4">
                <h2>Datos del Cliente</h2>
                <form id="CreateUser" action="SvEstudiantes" method="Post">
                    <div class="col-md-12">
                        <div class="mb-3">
                        <label>Nombre del estudiante</label><input tabindex="1" type="text" name="nombre" class="form-control" required value="<%= nombre %>">
                    </div>

                    <div class="mb-3">
                       <label>Apellidos</label><input tabindex="2" type="text" name="apellido" class="form-control" required value="<%= apellido %>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Sexo</label><br>
                        <div class="form-check form-check-inline">
                            <input tabindex="3" class="form-check-input" type="radio" name="sexo" value="Masculino" required <%= hombre %>>
                            <label class="form-check-label" for="masculino">Masculino</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input tabindex="4" class="form-check-input" type="radio" name="sexo" value="Femenino" required <%= mujer %>>
                            <label class="form-check-label" for="femenino">Femenino</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input tabindex="5" class="form-check-input" type="radio" name="sexo" value="Otro" required <%=otro%>> 
                            <label class="form-check-label" for="otro">Otro</label>
                        </div>
                    </div>



                    <div class="mb-3">
                       <label>Numero de Contacto</label><input tabindex="6" type="text" name="telefono" class="form-control" required value="<%= telefono %>">
                    </div>

                    <div class="mb-3">
                       <label>NIE</label><input tabindex="7" type="text" name="nie" class="form-control" required value="<%= nie %>">
                    </div>

                    <div class="mb-3">
                       <label>Municipio de residencia</label><input tabindex="8" type="text" name="municipio" class="form-control" required value="<%= municipio %>">
                    </div>

                    <div class="mb-3">
                       <label>Nombre del encargado</label><input tabindex="9" type="text" name="encargado" class="form-control" required value="<%= encargado %>">
                    </div>
                    <button tabindex="10" type="submit" class="btn btn-success">Enviar</button>
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
                                <th>Editar</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% List<Estudiante> estudiantes = (List<Estudiante>) request.getAttribute("estudiantes");

                            if(estudiantes == null && _estudiantes != null){
                                estudiantes = _estudiantes;
                            }

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
                                        <form id="EditUser" action="EditarEstudiante" method="get">
                                            <input type="hidden" name="idEstudianteEdit" value="<%= estudiante.getId() %>">
                                            <button type="submit" class="btn btn-warning">Editar</button>
                                        </form>
                                    </td>
                                    <td>
                                        <form id="DeleteUser" action="EliminarEstudiante" method="post">
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

<script src="js/index.js"></script>
