package com.demo.hello.service;

import com.demo.hello.dto.*;

import java.util.List;

public interface HelloFiisService {
    //Sign In
    Usuario autenticarUsuario (Usuario usuario);

    //Sign Up (Alumno)
    Usuario registrarUsuario (Usuario usuario);

    //Modificaciones Generales
    void modificarUsuario (Usuario usuario);

    //Operaciones Admin
    void crearUsuario (Usuario usuario); //Asesores y otros Admin
    void crearAsesoria (Asesoria asesoria);
    void modificarAsesoria (Asesoria asesoria);
    void eliminarUsuario (Usuario usuario);
    void modificarLinkCurso (Curso curso);

    //Generales
    List<Curso> mostrarCursos (CursoEspecialidad cursoEspecialidad, Usuario usuario);
    List<Curso> mostrarCurso (Curso curso);
    List<Asesoria> mostrarAsesorias (Curso curso);
    List<Usuario> mostrarUsuario (Usuario usuario);
    List<Inscripcion> mostrarInscripciones (Asesoria asesoria);
    Inscripcion crearInscripcion (Inscripcion inscripcion);
}
