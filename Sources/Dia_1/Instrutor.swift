import Foundation
class Instrutor: User { 
    let especialidade : CategoriasAulas
    

    init(especialidade:CategoriasAulas,nome:String, email:String , tipo : tipoUser){
        self.especialidade = especialidade
        super.init(nome: nome, email: email, tipo: tipo)
    }
    override func descricao() -> String {
        var out = super.descricao()

        return out+"\nEspecialidade = \(self.especialidade)"
    }
}