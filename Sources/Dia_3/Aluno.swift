import Foundation

class Aluno:User{
    
    var plano : Plano?
    let nivel : ExperienciaNivel 
    
    init( nivel: ExperienciaNivel ,nome:String, email:String , tipo : tipoUser){
        
        self.nivel = nivel
        super.init(nome: nome, email: email, tipo: tipo)
    }

    func addPlano(planoAluno:String)->Bool{
        if self.plano == nil {
        let planoT: Plano? = catalogo.obter(nome:planoAluno)
        if let plano = planoT {
            self.plano = plano
            return true
        }else{
            return false
        }
        }else{
            return false
        }
    }

    func alterarPlano(planoAluno:String)->Bool{
        let planoT : Plano? = catalogo.obter(nome: planoAluno)
        if let plano = planoT{
            self.plano = plano
            return true
        }else{
            return false
        }
    }




    override func descricao() -> String{
        if self.plano != nil{
        return """
        Nome: \(self.nome)
        Email: \(self.getEmail())
        Tipo: \(self.tipo)
        Plano: \(self.plano!.getNome())
        Nivel: \(self.nivel)
        """}else{
        return """
        Nome: \(self.nome)
        Email: \(self.getEmail())
        Tipo: \(self.tipo)
        Plano: Inativo
        Nivel: \(self.nivel)
        """
        }
    }
}

