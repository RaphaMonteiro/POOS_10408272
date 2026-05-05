import Foundation
class Instrutor: User { 
    
    let especialidade : CategoriasAulas
    private (set) var Agendamentos: [(CategoriasAulas,Aluno,Instrutor,data)] = []
    

    init(especialidade:CategoriasAulas,nome:String, email:String , tipo : tipoUser){
        
        self.especialidade = especialidade
        super.init(nome: nome, email: email, tipo: tipo)
    }


    func agendarAulaPersonal(categoria: CategoriaAulas ,aluno:Aluno, instrutor:Instrutor, data: Date)-> Bool{
            self.Agendamentos.append((categoria,aluno,instrutor,data))
            return true
    }



    override func descricao() -> String {
        var out = super.descricao()

        return out+"\nEspecialidade = \(self.especialidade)"
    }
}