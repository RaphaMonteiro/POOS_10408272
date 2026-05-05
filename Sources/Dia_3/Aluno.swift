import Foundation

class Aluno:User{
    
    var plano : Plano? = nil
    let nivel : ExperienciaNivel 
    
    init( nivel: ExperienciaNivel ,nome:String, email:String , tipo : tipoUser){
        
        self.nivel = nivel
        super.init(nome: nome, email: email, tipo: tipo)
    }

    func addPlano(planoAluno:String){
        if self.plano == nil {
        let planoT: Plano? = Unidade.shared.catalogo.obter(nome:planoAluno)
        if let plano = planoT {
            self.plano = plano  
        }
        
    }
    }

    func alterarPlano(planoAluno:String){
        let planoT : Plano? = Unidade.shared.catalogo.obter(nome: planoAluno)
        if let plano = planoT{
            self.plano = plano
        }
    }




    override func descricao() -> String{

        let out = super.descricao() 

        if self.plano != nil{
        return out+"\nPlano: \(self.plano!.getNome())\nNivel: \(self.nivel)"}else{
        return out+"\nPlano: Inativo\nNivel: \(self.nivel)"
        }
    }
}

