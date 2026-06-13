object montaña{
    method construccionPara(unConstructor,cantHoras) {
        return new Muralla(longitud=cantHoras/2)
    }
}
object costa{
    method construccionPara(unConstructor,cantHoras) {
        return new Museo(superficie=cantHoras, indiceImportancia=1)
    }
}
object llanura{
    method construccionPara(unConstructor,cantHoras) {
        return
            if (unConstructor.esDestacado())
                montaña.construccionPara(unConstructor, cantHoras) 
            else
                new Museo(superficie=cantHoras/2, indiceImportancia=(5.min(unConstructor.recursos().div(7))).max(1))
    }
}
object imagilandia{
    method construccionPara(unConstructor,cantHoras){
        return
            if (unConstructor.inteligencia()>77)
                new Museo(superficie=cantHoras, indiceImportancia=5)
            else
                new Muralla(longitud=0.5)
    }
}

class Muralla{
    const longitud

    method valor() = longitud*10
}
class Museo{
    const superficie
    const indiceImportancia

    method valor() = superficie*indiceImportancia
}