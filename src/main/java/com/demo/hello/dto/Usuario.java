package com.demo.hello.dto;

import lombok.Data;

import java.util.List;

@Data
public class Usuario {
    public String nombre;
    public String apellido;
    public String especialidad;
    public String codUni;
    public String correoUni;
    public Integer ciclo;
    public List<Curso> cursosPreferencia;
    public String tipoUsuario;
    public String descripcion;
    public String credencial;
}
