/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import Logica.Estudiante;
import java.util.List;

/**
 *
 * @author Gotow
 */
public class ControladoraPersistencia {
    EstudianteJpaController estuJpa = new EstudianteJpaController();
    
    public void CrearEstudiante(Estudiante estu){
        estuJpa.create(estu);
    }
    
    public List<Estudiante> ObtenerEstudiantes(){
        return estuJpa.findEstudianteEntities();
    }
}
