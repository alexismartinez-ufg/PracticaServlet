<%-- 
    Document   : editar
    Created on : 09-22-2023, 11:46:28 PM
    Author     : Gotow
--%>

<%@page import="Logica.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <% 
                
                Estudiante estudianteToEdit = (Estudiante) session.getAttribute("estudianteToEdit");
                
                int id = 0;
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
                    id = estudianteToEdit.getId();
                    sexo = estudianteToEdit.getSexo();
                    nombre = estudianteToEdit.getNombre();
                    apellido = estudianteToEdit.getApellido();
                    hombre = (sexo.equalsIgnoreCase("masculino") ? "checked" : "");
                    mujer = sexo.equalsIgnoreCase("femenino") ? "checked" : "";
                    otro = sexo.equalsIgnoreCase("otro") ? "checked" : "";
                    telefono = estudianteToEdit.getTelefono();
                    nie = estudianteToEdit.getNie();
                    municipio = estudianteToEdit.getMunicipio();
                    encargado = estudianteToEdit.getEncargado();
                }
            %>
                    
            <div class="container">
                <div class="d-flex justify-content-center mt-5">
                    <div class="col-md-4">
                    <h2>Editar Datos del Cliente</h2>
                    <form id="CreateUser" action="EditarEstudiante" method="Post">
                        <input type="hidden" name="idEstudiante" value="<%= id %>">
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
                        <button tabindex="10" type="submit" class="btn btn-success">Editar</button>
                        </div>
                    </form>
                </div>
            </div>
        
    </body>
</html>

<script src="js/index.js"></script>