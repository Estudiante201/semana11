package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Jugador;
import com.redsocial.servicio.JugadorServicio;

@Controller
public class JugadorCrudController {

	@Autowired
	private JugadorServicio servicio;
	
	@RequestMapping("/verCrudJugador")
	public String ver() {
		return "crudJugador";
	}
	
	@RequestMapping("/consultaCrudJugador")
	public String lista(String filtro, Model m) {
		List<Jugador> lista =  servicio.listaJugadorPorNombre(filtro+"%");
		m.addAttribute("jugadores", lista);
		return "crudJugador";
	}
	
	@RequestMapping("/registraActualizaCrudJugador")
	public String registraActualiza(Jugador obj, Model m) {
		servicio.insertaActualizaJugador(obj);
		List<Jugador> lista =  servicio.listaJugador();
		m.addAttribute("jugadores", lista);
		return "crudJugador";
	}
	
	@RequestMapping("/eliminaCrudJugador")
	public String elimina(int id, Model m) {
		servicio.eliminaJugador(id);
		List<Jugador> lista =  servicio.listaJugador();
		m.addAttribute("jugadores", lista);
		return "crudJugador";
	}
}
