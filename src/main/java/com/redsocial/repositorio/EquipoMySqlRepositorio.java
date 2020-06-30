package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Equipo;

@Repository
public class EquipoMySqlRepositorio implements EquipoRepositorio{

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<Equipo> mapperEquipo = new RowMapper<Equipo>() {
		@Override
		public Equipo mapRow(ResultSet rs, int rowNum) throws SQLException {
			Equipo obj = new Equipo();
			obj.setIdEquipo(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			return obj;
		}
	};
	
	@Override
	public List<Equipo> listaEquipo() {
		List<Equipo> lista = jdbcTemplate.query("select * from equipo", new Object[] {} ,mapperEquipo);
		return lista;
	}

}
