class Persona{
    var monedas = 20
    var edad
    
    method esDestacado() = edad.between(18,65) && monedas>30
    method recursos() = monedas

    method ganarMonedas(unaCantidad){
        monedas += unaCantidad
    }
    method gastarMonedas(unaCantidad){
        monedas -= unaCantidad
    }
    method cumplirAños(){
        edad += 1
    }
    method trabajarEnPlanetaDurante(unPlaneta, cantHoras){}
}
class Productor inherits Persona{
    const tecnicas = ["cultivo"]
    
    override method recursos() = monedas * tecnicas.size()
    override method esDestacado() = super() || tecnicas.size()>5

    method aprender(unaTecnica){
        tecnicas.add(unaTecnica)
    }
    method realizarTecnicaDurante(unaTecnica, cantHoras){
        if (tecnicas.contains(unaTecnica))
            self.ganarMonedas(3*cantHoras)
        else
            self.gastarMonedas(1)
    }
    override method trabajarEnPlanetaDurante(unPlaneta, cantHoras){
        if (unPlaneta.habitantes().contains(self))
            self.realizarTecnicaDurante(tecnicas.last(), cantHoras)
    }

    
}
class Constructor inherits Persona{
    var cantConstRealizadas
    var region
    var property inteligencia = 50
    
    override method recursos() = super() + (10*cantConstRealizadas)
    override method esDestacado() = cantConstRealizadas>5

    override method trabajarEnPlanetaDurante(unPlaneta, cantHoras){
        unPlaneta.agregarConstruccion(region.construccionPara(self, cantHoras))
        cantConstRealizadas+=1
        self.gastarMonedas(5)
    }
}
