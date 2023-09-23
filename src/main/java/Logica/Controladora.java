/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import Persistencia.ControladoraPersistencia;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;


/**
 *
 * @author Gotow
 */
public class Controladora {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void CrearEstudiante(Estudiante estu){
        controlPersis.CrearEstudiante(estu);
    }
     
    public List<Estudiante> ObtenerEstudiantes(){
        return controlPersis.ObtenerEstudiantes();
    }
    
    public void EliminarEstudiante(int userid) throws NonexistentEntityException{
        if(userid!=0){
            controlPersis.EliminarEstudiante(userid);
        }
    }
    
    public Estudiante ObtenerUsuarioById(int idEstudiante){
        return controlPersis.ObtenerUsuarioById(idEstudiante);
    }
    
    public void EditarEstudiante(Estudiante estu) throws Exception{
        controlPersis.EditarEstudiante(estu);
    }
}
