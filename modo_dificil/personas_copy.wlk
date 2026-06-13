//Idea potenciada por IA, y me convenció que alguien en la clase del sábado 13-06 preguntó por algo parecido.
class Persona2{
    var monedas = 20
    var edad
    var profesion
    var property inteligencia

    method esDestacado() = edad.between(18,65) && monedas>30
    method recursos() = profesion.recursos(self)
    method monedas() = monedas
    method ganarMonedas(unaCantidad){
        monedas += unaCantidad
    }
    method gastarMonedas(unaCantidad){
        monedas -= unaCantidad
    }
    method cumplirAños(){
        edad += 1
    }
    method trabajarEnPlanetaDurante(unPlaneta, cantHoras){
        profesion.trabajarEnPlanetaDurante(self, unPlaneta, cantHoras)
    }
    method cambiarProfesion(unaProfesion){
        profesion=unaProfesion
    }
    method realizarTecnicaDurante(unaTecnica, cantHoras){
        profesion.realizarTecnicaDurante(self, unaTecnica, cantHoras)
    }
    
}
class PersonaChill{
    method recursos(unaPersona) = unaPersona.recursos()
}
class Productor{
    const tecnicas = ["cultivo"]
    
    method recursos(unaPersona) = unaPersona.monedas() * tecnicas.size()
    method esDestacado(unaPersona) = unaPersona.esDestacado() || tecnicas.size()>5

    method aprender(unaTecnica){
        tecnicas.add(unaTecnica)
    }
    method realizarTecnicaDurante(unaPersona, unaTecnica, cantHoras){
        if (tecnicas.contains(unaTecnica))
            unaPersona.ganarMonedas(3*cantHoras)
        else
            unaPersona.gastarMonedas(1)
    }
    method trabajarEnPlanetaDurante(unaPersona, unPlaneta, cantHoras){
        if (unPlaneta.habitantes().contains(unaPersona))
            unaPersona.realizarTecnicaDurante(tecnicas.last(), cantHoras)
    }

}
class Constructor{
    var cantConstRealizadas
    const region

    method recursos(unaPersona) = unaPersona.monedas() + (10*cantConstRealizadas)
    method esDestacado(unaPersona) = cantConstRealizadas>5

    method trabajarEnPlanetaDurante(unaPersona, unPlaneta, cantHoras){
        unPlaneta.agregarConstruccion(region.construccionPara(unaPersona, cantHoras))
        cantConstRealizadas+=1
        unaPersona.gastarMonedas(5)
    }
}
