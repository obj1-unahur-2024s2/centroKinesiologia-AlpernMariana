import pacientesAparatos.*

object centroKinesio{
    const pacientes=[]
    const aparatos =[]

method agregarPacientes(listaPacientes)= pacientes.addAll(listaPacientes)
method agregarAparatos(listaAparatos)= aparatos.addAll(listaAparatos)

method coloresAparatos()=
       aparatos.map({a=>a.color()}).asSet()

method pacientesMenoresDe(unaEdad)=
       pacientes.filter({p=>p.edad()<unaEdad})

method cuantosPacientesNoPuedenCumplirSesion()=
       pacientes.count({p=> !p.puedeRealizarRutina()})

method optimasCondiciones()= aparatos.all({a=>!a.necesitaMantenimiento()})

method estaComplicado()= aparatos.size()/2 <= self.cuantosNecesitanMantenimiento()

method cuantosNecesitanMantenimiento() = aparatos.count({a=>a.necesitaMantenimiento()})

method cualesNecesitanMantenimiento() = aparatos.filter({a=>a.necesitaMantenimiento()})

method visitaTecnica(){
  self.cualesNecesitanMantenimiento().forEach({a=>a.recibirMantenimiento()})  
}
}