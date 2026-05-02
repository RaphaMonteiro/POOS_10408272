import Foundation

protocol Manutencao {
    var nomeMaquina: String {get}
    var id : String {get}
    var historicoMaquina: String {get}

    func realizarManutencao(data: String)-> Bool
    func estaEmDia() -> Bool
}

class Maquina:Manutencao{
    let nomeMaquina: String
    let id: String
    private(set) var historicoMaquina: [String] = []
    private(set) var operacional: Bool 

    init(nomeMaquina:String,operacional:Bool){
        self.nomeMaquina = nomeMaquina
        self.id = String(Int(random()))
        self.operacional = operacional

    }

    func realizarManutencao(data: String) -> Bool {
        self.historicoMaquina.append(data)

        //checkMaquina
        //fixMaquina
        //if fiz maquina true operacional true

        if operacional{
            return true
        }else{return false}
    }

    func estaEmDia() -> Bool {
        if (historicoMaquina.last - today) > 30{
            return false
        }else{
            return true
        }
    }


}

