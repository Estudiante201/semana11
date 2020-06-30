package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.Equipo;
import com.redsocial.repositorio.EquipoRepositorio;

@Service
public class EquipoServicioImpl implements EquipoServicio{

	@Autowired
	private EquipoRepositorio repositorio;

	@Override
	public List<Equipo> listaEquipo() {
		return repositorio.listaEquipo();
	} 
	
	

}


