import Foundation

class Unidade{
    //singleton
    static let shared = Unidade()

    //armazenamento e busca por chave
    private var Instrutores  : [UUID:Instrutor]
    private var Alunos : [UUID: Aluno]
    private var Maquinas : [UUID:Maquina]

    //Inicialização do catalogo da unidade
    private let catalogo = catalogoPlano()

    

    private func checkAluno(cAluno : Aluno)-> String{
        
        for (id, aluno) in Alunos{
            if aluno.getEmail == cAluno.getEmail {
                return true
            }
        }
        return false

    }
    
    func addAluno(nivel: ExperienciaNivel ,nome:String, email:String , tipo : tipoUser) -> Bool{
        cAluno = Aluno(nivel: ExperienciaNivel ,nome:String, email:String , tipo : tipoUser)
        if checkAluno(cAluno) {
            return false
        }else{
            self.Alunos.append(cAluno)
        }
        

    }

    private func checkAllMaquinas() -> [Maquina]{
        var atrasado = [Maquina]
        for (id,maq) in Maquinas{
            if !maq.estaEmDia(){
                atrasado.append(maq)
            }
        }
        return atrasado
    }

    func loteManutencao()-> Bool{
        var atrasado = checkAllMaquinas()
        if atrasado.isEmpty{
            return true
        }else{
            for m in atrasado{
                m.fixMaquina()
            }
        }
    }

    


}