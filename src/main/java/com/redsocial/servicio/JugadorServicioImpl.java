package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.Jugador;
import com.redsocial.repositorio.JugadorRepositorio;

@Service
public class JugadorServicioImpl implements JugadorServicio{

	@Autowired
	private JugadorRepositorio repositorio;

	@Override
	public Jugador insertaActualizaJugador(Jugador obj) {
		return repositorio.insertaActualizaJugador(obj);
	}

	@Override
	public void eliminaJugador(int idJugador) {
		repositorio.eliminaJugador(idJugador);
	}

	@Override
	public List<Jugador> listaJugador() {
		return repositorio.listaJugador();
	}

	@Override
	public List<Jugador> listaJugadorPorNombre(String nom) {
		return repositorio.listaJugadorPorNombre(nom);
	}

	@Override
	public List<Jugador> listaJugador(int idEquipo, String nombre, String posicion) {
		return repositorio.listaJugador(idEquipo, nombre, posicion);
	} 
	


}


