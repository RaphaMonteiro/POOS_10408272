import Foundation

enum CategoriasAulas:String, CaseIterable {
	case Musculacao = "Musculacao"
	case Spinning = "Spinning"
	case Yoga = "Yoga" 
	case Funcional = "Funcional"
	case Luta = "Artes Marciais"
    
	}

class Unidade{

    //singleton
    static let shared : Unidade = Unidade()

    private init(){
        self.Instrutores = [:]
        self.Alunos = [:]
        self.Maquinas = [:]
        self.Aulas = []
        self.AgendamentosPersonal = []
    }

    //armazenamento e busca por chave
    private var Instrutores  : [UUID:Instrutor]
    private var Alunos : [UUID: Aluno]
    private var Maquinas : [UUID:Maquina]
    private var Aulas : [Aula]
    private var AgendamentosPersonal : [(categoria: CategoriasAulas ,aluno:Aluno, instrutor:Instrutor, data: Date)]
    

    //Inicialização do catalogo da unidade
    public var catalogo = catalogoPlano()

    

    private func checkAluno(cAluno : Aluno)-> Bool{
        
        for (_, aluno) in Alunos{
            if aluno.getEmail() == cAluno.getEmail() {
                return true
            }
        }
        return false

    }

    private func checkInstrutor(cInstrutor : Instrutor)-> Bool{
        
        for (_, instrutor) in Instrutores{
            if instrutor.getEmail() == instrutor.getEmail() {
                return true
            }
        }
        return false

    }


    
    func criarAluno(nivel: ExperienciaNivel ,nome:String, email:String , tipo : tipoUser) -> UUID?{
        let cAluno = Aluno(nivel:nivel ,nome:nome, email:email , tipo : tipo)
        if !checkAluno(cAluno: cAluno) {
            return nil
        }else{
            self.Alunos[cAluno.getId()] = cAluno
            return cAluno.getId()
        }
    }


    func addAluno(aAluno:Aluno) -> Bool{
        if !checkAluno(cAluno: aAluno) {
            return false
        }else{
            self.Alunos[aAluno.getId()] = aAluno
            return true
        }
    }

    func addInstrutor(especialidade:CategoriasAulas,nome:String, email:String , tipo : tipoUser)->Bool{
        var cInstrutor = Instrutor(especialidade:especialidade, nome:nome, email:email, tipo:tipo)
        if checkInstrutor(cInstrutor:cInstrutor) {
            return false
        }else{
            self.Instrutores[cInstrutor.getId()] = cInstrutor
            return true
        }
    }

    func getAluno(id: UUID)-> Aluno?{
        if let existente = Alunos[id]{
            return existente
        }else{
            return nil
        }
    }

    func agendarAulaPersonal(categoria: CategoriasAulas ,aluno:Aluno, instrutor:Instrutor, data: Date)-> Bool{
            if aluno.plano!.Modalidades.contains(categoria){
                if agendarAulaPersonal(categoria: categoria, aluno: aluno, instrutor: instrutor, data: data){
                    return true
                }else{
                    return false
                }
            
            }else{
                return false
            }
    }
    

    private func checkAllMaquinas() -> [Maquina]{
        var atrasado:[Maquina] = []
        for (_,maq) in self.Maquinas{
            if !maq.estaEmDia(){
                atrasado.append(maq)
            }
        }
        return atrasado
    }

    func loteManutencao()-> [Maquina]{
        let atrasado = checkAllMaquinas()
        var defeituoso: [Maquina] = []
        if atrasado.isEmpty{
            return []
        }else{
            for m in atrasado{
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-yyyy" 
                let today = formatter.string(from: Date())
                
                if !m.realizarManutencao(data: today ){
                    defeituoso.append(m)
                }
            }
            return defeituoso
        }
        
    }

}
