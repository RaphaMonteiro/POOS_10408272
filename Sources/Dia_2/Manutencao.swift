import Foundation

protocol Manutencao {
    var nomeMaquina: String {get}
    var id : UUID {get}
    var historicoMaquina: [String] {get}

    func realizarManutencao(data: String)-> Bool
    func estaEmDia() -> Bool
}

class Maquina : Manutencao{
    let nomeMaquina: String
    let id: UUID
    private(set) var historicoMaquina: [String] = []
    private(set) var operacional: Bool 

    init(nomeMaquina:String,operacional:Bool){
        self.nomeMaquina = nomeMaquina
        self.id = UUID()
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
        //let last = formatter.date(historicoMaquina.last)
        let last = Date()
        let today = Date()
        let calendar = Calendar.current
        if let dataLimite = calendar.date(byAdding: .day, value: 30, to: last),
        today>=dataLimite{
            return false
        }else{
            return true
        }
    }


}

