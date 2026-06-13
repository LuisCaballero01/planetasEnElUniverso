import modo_dificil.personas_copy.*
class Planeta{
    const construcciones = []
    const property habitantes = []

    method delegacionDiplomatica() = (self.habitantesDestacados() + self.habitanteMasRico()).withoutDuplicates()
    method habitantesDestacados() = habitantes.filter({h => h.esDestacado()})
//Forzar con corchetes la creación del objeto como lista, no recuerdo si lo hicimos alguna vez.
    method habitanteMasRico() = [habitantes.max({h => h.recursos()})]
    method esValioso() = construcciones.all({c => c.valor()>100})

    method agregarConstruccion(unaConstruccion){
        construcciones.add(unaConstruccion)
    }

// Método que permite autoenviarse el mensaje a la vez que se lo manda al invadido.
    method trabajarDelegacionDePlanetaDurante(unPlaneta, cantHoras){
        self.delegacionDiplomatica().forEach({h => h.trabajarEnPlanetaDurante(unPlaneta, cantHoras)})
    }
    method invadirPlanetaYHacerLaburar(unPlaneta,cantHoras){
        unPlaneta.trabajarDelegacionDePlanetaDurante(self, cantHoras)
    }
}