package com.demo.hello.dao;

import com.demo.hello.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public abstract class HelloFiisDaoImpl implements HelloFiisDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    //Sign In
    public Usuario autenticarUsuario(Usuario usuario) {
        String SQL = "SELECT nombre,apellido,especialidad,ciclo,correo_uni,cod_uni, tipo_usuario FROM usuario " +
                " WHERE cod_uni = ? ";
        try{
            Connection con = jdbcTemplate.getDataSource().getConnection();
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setString(1, usuario.getCodUni());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                usuario = new Usuario();
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setEspecialidad(rs.getString("especialidad"));
                usuario.setCiclo(rs.getInt("ciclo"));
                usuario.setCorreoUni(rs.getString("correo_uni"));
                usuario.setCodUni(rs.getString("cod_uni"));
                usuario.setTipoUsuario(rs.getString("tipo_usuario"));
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    //Sign Up
    public Usuario registrarUsuario(Usuario usuario) {
        String tipoUsuario = null;
        String SQL = " SELECT tipo_usuario FROM usuario WHERE cod_uni = ?";
        try{
            Connection con = jdbcTemplate.getDataSource().getConnection();
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setString(1, usuario.getCodUni());
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                tipoUsuario = rs.getString("tipo_usuario");
            }
            if (tipoUsuario == null){
                tipoUsuario = "alumno";
                String SQL1 = " INSERT INTO usuario(nombre,apellido,especialidad,ciclo,correo_uni, cod_uni, credencial,tipo_usuario )"+
                        " VALUES(?,?,?,?,?,?,?,?)";
                try{
                    ps = con.prepareStatement(SQL1);
                    ps.setString(1, usuario.getNombre());
                    ps.setString(2, usuario.getApellido());
                    ps.setString(3, usuario.getEspecialidad());
                    ps.setInt(4, usuario.getCiclo());
                    ps.setString(5, usuario.getCorreoUni());
                    ps.setString(6, usuario.getCodUni());
                    ps.setString(7, usuario.getCredencial());
                    ps.setString(8, tipoUsuario);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            else{
                String SQL2 = " UPDATE usuario " +
                        " SET nombre = ? , apellido = ? , especialidad = ? , ciclo = ? , correo_uni = ? , credencial = ? , descripcion = ?" +
                        " WHERE cod_uni = ? ";
                try{
                    ps = con.prepareStatement(SQL2);
                    ps.setString(1, usuario.getNombre());
                    ps.setString(2, usuario.getApellido());
                    ps.setString(3, usuario.getEspecialidad());
                    ps.setInt(4, usuario.getCiclo());
                    ps.setString(5, usuario.getCorreoUni());
                    ps.setString(6, usuario.getCredencial());
                    ps.setString(8, usuario.getDescripcion());
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ps.executeUpdate();
            ps.close();
            con.commit();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    //Modificaciones Generales
    public void modificarUsuario(Usuario usuario) {

    }

    //Operaciones Admin
    private Integer obtenerCodAsesoria(){
        Integer codAsesoria = 0;
        String SQL = "SELECT nvl(MAX(cod_asesoria)+1,1) codigo FROM asesoria";
        try{
            Connection con = jdbcTemplate.getDataSource().getConnection();
            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(SQL);
            while(rs.next()){
                codAsesoria = rs.getInt("codigo");
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return codAsesoria;
    }
    public void crearAsesoria(Asesoria asesoria) {
        String SQL = " INSERT INTO asesoria(cod_asesoria,cod_asesor,cod_curso,cod_usuario_creacion,link_asesoria,fecha_inicio_inscrip,fecha_final_inscrip,cap_max,cap_min,fecha_asesoria,hora_inicio,hora_final,tema,descripcion)"+
                " (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try{
            Connection con = jdbcTemplate.getDataSource().getConnection();
            PreparedStatement ps = con.prepareStatement(SQL);
            asesoria.setCodAsesoria(obtenerCodAsesoria());
            ps.setInt(1, asesoria.getCodAsesoria());
            ps.setString(2, asesoria.getCodAsesor());
            ps.setString(3, asesoria.getCodCurso());
            ps.setString(4, asesoria.getCodUsuarioCreacion());
            ps.setString(5, asesoria.getLinkAsesoria());
            ps.setString(6, asesoria.getFechaInicioInscripcion());
            ps.setString(7, asesoria.getFechaFinalInscripcion());
            ps.setInt(8, asesoria.getCapMax());
            ps.setInt(9, asesoria.getCapMin());
            ps.setString(10, asesoria.getFechaAsesoria());
            ps.setString(11, asesoria.getHoraInicio());
            ps.setString(12, asesoria.getHoraFinal());
            ps.setString(13, asesoria.getTema());
            ps.setString(14, asesoria.getDescripcion());
            ps.executeUpdate();
            ps.close();
            con.commit();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void modificarAsesoria(Asesoria asesoria) {

    }

    public void crearUsuario(Usuario usuario) {

    }

    public void eliminarUsuario(Usuario usuario) {

    }

    public void modificarLinkCurso(Curso curso) {

    }

    //Generales
    public List<Curso> mostrarCursos(CursoEspecialidad cursoEspecialidad, Usuario usuario) {
        List<Curso> listaCurso = new ArrayList<Curso>();
        return listaCurso;
    }

    public List<Curso> mostrarCurso(Curso curso) {
        List<Curso> listaCurso = new ArrayList<Curso>();
        return listaCurso;
    }

    public List<Asesoria> mostrarAsesorias(Curso curso) {
        List<Asesoria> listaAsesoria = new ArrayList<Asesoria>();
        return listaAsesoria;
    }

    public List<Usuario> mostrarUsuario(Usuario usuario) {
        List<Usuario> listaUsuario = new ArrayList<Usuario>();
        return listaUsuario;
    }

    public List<Inscripcion> mostrarInscripciones(Asesoria asesoria) {
        List<Inscripcion> listaInscripcion = new ArrayList<Inscripcion>();
        return listaInscripcion;
    }

    public Inscripcion crearInscripcion(Inscripcion inscripcion) {
        return inscripcion;
    }
}
