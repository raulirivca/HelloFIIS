package com.demo.hello.service;

import com.demo.hello.dao.HelloFiisDao;
import com.demo.hello.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class HelloFiisServicioImpl implements HelloFiisService {
    @Autowired
    private HelloFiisDao dao;

    //Sign In
    public Usuario autenticarUsuario(Usuario usuario) {
        return dao.autenticarUsuario(usuario);
    }

    //Sign Up (Alumno)
    public Usuario registrarUsuario(Usuario usuario) {
        return dao.registrarUsuario(usuario);
    }

    //Modificaciones Generales
    public void modificarUsuario(Usuario usuario) {

    }

    //Operaciones Admin
    public void crearUsuario(Usuario usuario) {

    }

    public void crearAsesoria(Asesoria asesoria) {

    }

    public void modificarAsesoria(Asesoria asesoria) {

    }

    public void eliminarUsuario(Usuario usuario) {

    }

    public void modificarLinkCurso(Curso curso) {

    }

    //Generales
    public List<Curso> mostrarCursos(CursoEspecialidad cursoEspecialidad, Usuario usuario) {
        return dao.mostrarCursos(cursoEspecialidad,usuario);
    }

    public List<Curso> mostrarCurso(Curso curso) {
        return dao.mostrarCurso(curso);
    }

    public List<Asesoria> mostrarAsesorias(Curso curso) {
        return dao.mostrarAsesorias(curso);
    }

    public List<Usuario> mostrarUsuario(Usuario usuario) {
        return dao.mostrarUsuario(usuario);
    }

    public List<Inscripcion> mostrarInscripciones(Asesoria asesoria) {
        return dao.mostrarInscripciones(asesoria);
    }

    public Inscripcion crearInscripcion(Inscripcion inscripcion) {
        return dao.crearInscripcion(inscripcion);
    }
}

