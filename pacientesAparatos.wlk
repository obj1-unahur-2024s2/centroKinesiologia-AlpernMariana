class Paciente{
  var edad 
  var nivelFortaleza
  var nivelDolor
  const property rutina = [] 
  
  method nivelFortaleza() =nivelFortaleza
  method nivelDolor() = nivelDolor
  method edad() = edad
  method puedeUsar(unAparato)= unAparato.puedeUsarlo(self)
  method disminuirDolor(unValor){nivelDolor =nivelDolor-unValor}
  method aumentarFortaleza(valor){nivelFortaleza = nivelFortaleza + valor}
  method usarAparato(unAparato){
         if (not self.puedeUsar(unAparato)){
          self.error("no puede usar el aparato")}

          unAparato.efectoAparato(self)
         
                
  }
  method asignarRutina(unaRutina){
    rutina.clear()
    rutina.addAll(unaRutina)
  }
  method puedeRealizarRutina() = rutina.all({a=>self.puedeUsar(a)})
  method realizarRutina() {rutina.forEach({a=>self.usarAparato(a)})}
}

class Resistente inherits Paciente{
  override method realizarRutina(){
    super()
    nivelFortaleza+= rutina.size()
  } 
}

class Caprichoso inherits Paciente{
  override method puedeRealizarRutina()= 
      super() && rutina.any({a=>a.color() == "rojo"}) 
  override method realizarRutina(){
   super()
   super()
  }
}

class RapidaRecuperacion inherits Paciente{
  override method realizarRutina(){
    super()
    self.disminuirDolor(disminucionDolor.valorDisminucion())
  }
}

  object disminucionDolor{
    var property valorDisminucion = 3
  }

class Aparato{
  const property color = "blanco"
  method efectoAparato(unPaciente)
  method necesitaMantenimiento()=false
  method recibirMantenimiento(){}
  
  }
  
class Magneto inherits Aparato{
 var imantacion = 800
 method puedeUsarlo(unPaciente) = true
 override method efectoAparato(unPaciente){
  unPaciente.disminuirDolor(unPaciente.nivelDolor()*0.1)
  imantacion -=1
 }
 override method necesitaMantenimiento()= imantacion<100
 override method recibirMantenimiento(){(imantacion+500).min(800)}
}
class Bicicleta inherits Aparato{
  var tornillosDesajustados=0
  var aceitePerdido = 0
 method puedeUsarlo(unPaciente) = unPaciente.edad()>8
 override method efectoAparato(unPaciente){
  self.desgastePorPaciente(unPaciente)
  unPaciente.disminuirDolor(4)
  unPaciente.aumentarFortaleza(3)
 }
 method desgastePorPaciente(unPaciente){
  if (unPaciente.nivelDolor()>30){tornillosDesajustados+=1}
  if (unPaciente.edad().between(30, 50)){aceitePerdido+=1}
 }
 override method necesitaMantenimiento() = 
            tornillosDesajustados>=10 || aceitePerdido>=5
 override method recibirMantenimiento(){
            tornillosDesajustados=0
            aceitePerdido=0
 }
}
class Minitramp inherits Aparato{
 method puedeUsarlo(unPaciente) = unPaciente.nivelDolor()<20
 override method efectoAparato(unPaciente){
  unPaciente.aumentarFortaleza(unPaciente.edad()*0.1)

 }
}

