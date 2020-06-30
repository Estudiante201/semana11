package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Equipo;
import com.redsocial.entidad.Jugador;

@Repository
public class JugadorMySqlRepositorio implements JugadorRepositorio{

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<Jugador> mapperJugador = new RowMapper<Jugador>() {
		@Override
		public Jugador mapRow(ResultSet rs, int rowNum) throws SQLException {
			Jugador obj = new Jugador();
			obj.setIdJugador(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			obj.setFechaNacimiento(rs.getString(3));
			obj.setSueldo(rs.getDouble(4));
			obj.setPosicion(rs.getString(5));
			obj.setTalla(rs.getDouble(6));
			obj.setEmail(rs.getString(7));
			
			Equipo objEquip = new Equipo();
			objEquip.setIdEquipo(rs.getInt(8));
			objEquip.setNombre(rs.getString(9));
		
			obj.setEquipo(objEquip);
			
			return obj;
		}
	};
	
	@Override
	public Jugador insertaActualizaJugador(Jugador obj) {
		Jugador salida = null;
		if (obj.getIdJugador() == 0) {
			jdbcTemplate.update("insert into jugador values(null,?,?,?,?,?,?,?)",
			new Object[] {obj.getNombre(), obj.getFechaNacimiento(), obj.getSueldo(), obj.getPosicion(), obj.getTalla(), obj.getEmail(),obj.getEquipo().getIdEquipo()});	
			List<Jugador> lista = jdbcTemplate.query("select m.*,d.nombre from jugador m inner join equipo d on m.idEquipo = d.idEquipo order by m.idJugador desc limit 0, 1",new Object[] {} ,mapperJugador);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update jugador set nombre=?,fechaNacimiento=?,sueldo=?,posicion=?,talla =?,email =?, idEquipo = ? where idJugador=?", new Object[] {obj.getNombre(), obj.getFechaNacimiento(), obj.getSueldo(), obj.getPosicion(), obj.getTalla(), obj.getEmail(), obj.getEquipo().getIdEquipo(), obj.getIdJugador()});
			List<Jugador> lista = jdbcTemplate.query("select m.*,d.nombre from jugador m inner join equipo d on m.idEquipo = d.idEquipo where m.idJugador =?",new Object[] {obj.getIdJugador()} ,mapperJugador);
			salida = lista.get(0);
		}
		return salida;
	}

	@Override
	public void eliminaJugador(int idJugador) {
		jdbcTemplate.update("delete from jugador where idJugador = ?",new Object[] {idJugador});		
	}

	@Override
	public List<Jugador> listaJugador() {
		List<Jugador> lista = jdbcTemplate.query("select m.*,d.nombre from jugador m inner join equipo d on m.idEquipo = d.idEquipo", new Object[] {} ,mapperJugador);
		return lista;
	}

	@Override
	public List<Jugador> listaJugadorPorNombre(String nom) {
		List<Jugador> lista = jdbcTemplate.query("select m.*,d.nombre from jugador m inner join equipo d on m.idEquipo = d.idEquipo where m.nombre like ?", new Object[] {nom} ,mapperJugador);
		return lista;
	}

	@Override
	public List<Jugador> listaJugador(int idEquipo, String nombre, String posicion) {
		List<Jugador> lista = jdbcTemplate.query("select m.*,d.nombre from jugador m inner join equipo d on m.idEquipo = d.idEquipo where m.idEquipo =? and m.nombre like ? and m.posicion= ? ", new Object[] {idEquipo, nombre, posicion} ,mapperJugador);
		return lista;
	}

}
