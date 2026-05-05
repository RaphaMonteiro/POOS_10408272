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
        var operante : Bool = false
        //hardcoded defeitos false para ilustrar cenario sem defeitos
        if self.checkMaquina(defeito: false){
            operante = true
        }else{
            if self.fixMaquina() {
                operante = true
            }else{
                operante = false
            }
        }

        if operante{
            return true
        }else{
            return false}
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

    func checkMaquina(defeito:Bool) -> Bool{
        //verifica danos e realiza avaliação preventiva 
        if !defeito{
            return true
        }else{
            return false
        }
    }

    func fixMaquina() -> Bool{
        //cenario em que a maquina é consertada
        return true
    }

    


}

