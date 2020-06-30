package com.redsocial.servicio;

import java.util.List;

import com.redsocial.entidad.Jugador;

public interface JugadorServicio {

	public Jugador insertaActualizaJugador(Jugador obj);
	public void eliminaJugador(int idJugador);
	public List<Jugador> listaJugador();
	public List<Jugador> listaJugadorPorNombre(String nom);
	public List<Jugador> listaJugador(int idEquipo, String nombre,String posicion);

}
