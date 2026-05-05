import Foundation


class Unidade{

    //singleton
    static let shared : Unidade = Unidade()

    private init(){}

    //armazenamento e busca por chave
    private var Instrutores  : [UUID:Instrutor]
    private var Alunos : [UUID: Aluno]
    private var Maquinas : [UUID:Maquina]
    private var Aulas : [Aula]
    

    //Inicialização do catalogo da unidade
    private let catalogo = catalogoPlano()

    

    private func checkAluno(cAluno : Aluno)-> Bool{
        
        for (id, aluno) in Alunos{
            if aluno.getEmail() == cAluno.getEmail {
                return true
            }
        }
        return false

    }

    private func checkInstrutor(cInstrutor : Instrutor)-> Bool{
        
        for (id, instrutor) in Instrutores{
            if instrutor.getEmail == instrutor.getEmail {
                return true
            }
        }
        return false

    }
    
    func addAluno(nivel: ExperienciaNivel ,nome:String, email:String , tipo : tipoUser) -> Bool{
        var cAluno = Aluno(nivel:nivel ,nome:nome, email:email , tipo : tipo)
        if !checkAluno(cAluno: cAluno) {
            return false
        }else{
            self.Alunos[]
        }
    }

    func addInstrutor(especialidade:CategoriasAulas,nome:String, email:String , tipo : tipoUser){
        cInstrutor = Instrutor(especialidade:especialidade, nome:nome, email:email, tipo:tipo)
        if checkInstrutor(cInstrutor) {
            return false
        }else{
            self.Instrutor.append(cInstrutor)
        }
    }

    func agendarPersonal(categoria: CategoriaAulas ,aluno:Aluno, instrutor:Instrutor, data: Date)-> Bool{
        if Aluno.Modalidades.contains(categoria){
           if instrutor.agendarAulaPersonal(categoria: CategoriaAulas ,aluno:Aluno, instrutor:Instrutor, data: Date){
                return true
           }else{
            return false
           }
        }else{
            return false
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

    func loteManutencao()-> [Maquina]{
        var atrasado = checkAllMaquinas()
        var defeituoso: [Maquina] = []
        if atrasado.isEmpty{
            return []
        }else{
            for m in atrasado{
                var formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-yyyy" 
                var today = formatter.string(from: Date())
                
                if !realizarManutencao(data: today ){
                    defeituoso.append(m)
                }
            }
        }
    }

    

    


}