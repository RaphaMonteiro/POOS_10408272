import Foundation
class Instrutor: User { 
    
    let especialidade : CategoriasAulas
    private (set) var agendaInstrutor: [Date:(CategoriasAulas,Aluno,Instrutor)] = [:]
    

    init(especialidade:CategoriasAulas,nome:String, email:String , tipo : tipoUser){
        
        self.especialidade = especialidade
        super.init(nome: nome, email: email, tipo: tipo)
    }

    func agendar(categoria: CategoriasAulas ,aluno:Aluno, instrutor:Instrutor, data: Date)-> Bool{
           
            if let agendamento = agendaInstrutor[data]{ 
                return false
            }else{
                self.agendaInstrutor[data]=(categoria,aluno,instrutor)
                return true
            }

        }



    override func descricao() -> String {
        let out = super.descricao()

        return out+"\nEspecialidade = \(self.especialidade)"
    }
}