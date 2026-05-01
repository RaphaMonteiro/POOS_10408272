import Foundation

print("Dia 1 de Swift!!")


enum ExperienciaNivel:String {
	case Iniciante = "Iniciante"
	case Intermediario = "Intermediario"
	case Avançado = "Avançado"
	}
	
enum CategoriasAulas:String {
	case Musculação = "Musculação"
	case Spinning = "Spinning"
	case Yoga = "Yoga" 
	case Funcional = "Funcional"
	case Luta = "Artes Marciais"
    
	}
	
enum tipoUser:String{
	case Aluno = "Aluno"
	case Instrutor = "Instrutor"
	}

class User {
	let nome: String
	private var email: String
	let tipo : tipoUser
	
	init(nome:String, email:String , tipo : tipoUser){
        self.nome = nome
        self.email = email
        self.tipo = tipo
        }
    
    func getEmail() ->String{
        return email
    }
    func setEmail(email:String){
        self.email = email

    }
    func descricao() -> String {
        return """
        Nome: \(self.nome)
        Email: \(self.getEmail())
        Tipo: \(self.tipo)
        """
    }
}


class Aluno:User{
    let matricula : UUID
    var plano : Plano?
    let nivel : ExperienciaNivel 
    
    init( nivel: ExperienciaNivel ,nome:String, email:String , tipo : tipoUser){
        self.matricula = UUID()
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




enum PlanoErro: Error {
    case nomeVazio
    case validadeMensalidade
}

struct Plano {
    private let nome:String
    private var valorMensalidade : Double
    var possuiPersonal : Bool
    var limAulasDiaria: Int
    var validadeMensalidade: Int

    init(nome: String, valorMensalidade: Double, possuiPersonal: Bool, limAulasDiaria: Int, validadeMensalidade:Int){
        self.nome = nome
        self.valorMensalidade = valorMensalidade
        self.possuiPersonal = possuiPersonal
        self.limAulasDiaria = limAulasDiaria
        self.validadeMensalidade = validadeMensalidade


    }

    func getNome() -> String{
        return self.nome
    }
    func descricao() -> String{
        return"""
        Nome: \(self.getNome())
        Valor: \(self.valorMensalidade)
        Personal: \(self.possuiPersonal)
        Aulas Diarias: \(self.limAulasDiaria)
        Prazo: \(self.validadeMensalidade) 
        """
    }
}

protocol catalogoPlanoProtocol{
    func criar(nome: String, valorMensalidade: Double, possuiPersonal: Bool, limAulasDiaria: Int, validadeMensalidade:Int) ->Bool
    func obter(nome:String) -> Plano?
    func listar() -> [Plano]
    func apresentar() -> String
    func deletar(nome: String)
}

class catalogoPlano : catalogoPlanoProtocol{
    //singleton
    static let shared = catalogoPlano()

    private var planos: [String: Plano] = [:]

    //formatar chave nome
    private func formatar(_ nome:String) -> String{
        var nome = nome.trimmingCharacters(in: .whitespacesAndNewlines)
        return nome.uppercased()


    }

    //Create (não altera existentes)
    func criar(nome: String, valorMensalidade: Double, possuiPersonal: Bool, limAulasDiaria: Int, validadeMensalidade:Int) ->Bool{
        let chave = formatar(nome)

        guard planos[chave] == nil else{
            print("Plano já existe")
            return false
        }
        guard !chave.isEmpty else {
            print("Nome Invalido")
            return false
        }

        planos[chave] = Plano(nome: nome, valorMensalidade: valorMensalidade, possuiPersonal: possuiPersonal, limAulasDiaria: limAulasDiaria, validadeMensalidade: validadeMensalidade)
        return true
    }

    // READ 
    func obter(nome: String) -> Plano? {
        return planos[formatar(nome)]
    }

    func listar() -> [Plano] {
        return Array(planos.values)
    }
    
    //DELETAR 
    func deletar(nome:String){
        planos.removeValue(forKey: formatar(nome))
    }

    //Apresentar

    func apresentar() -> String {
        let all = self.listar()
        if !all.isEmpty{
            var out = ""
            for i in all{
                out=out + "\n \(i.descricao()) \n"
            }
            return out
        }else{
            return "catalogo vazio"
        }
    }

}

let catalogo = catalogoPlano()
catalogo.criar(nome: "Mensal", valorMensalidade: 120, possuiPersonal: false , limAulasDiaria: 1, validadeMensalidade: 30)
catalogo.criar(nome: "Trimestral", valorMensalidade: 110, possuiPersonal: false, limAulasDiaria: 2, validadeMensalidade: 90)
catalogo.criar(nome: "Semestral", valorMensalidade: 100, possuiPersonal: true, limAulasDiaria: 3, validadeMensalidade: 180)

let Aluno1 = Aluno(nivel: .Iniciante, nome: "Cau", email: "cau@cacau.cau", tipo: .Aluno)

Aluno1.addPlano(planoAluno: "Mensal")

let Aluno2 = Aluno(nivel: .Intermediario, nome: "COCAU", email: "COCAU@COCAU.cau", tipo: .Aluno)

Aluno2.addPlano(planoAluno: "Trimestral")

let ProfessorMusculacao1 = Instrutor(especialidade: .Musculação, nome: "Abacatao", email: "abacatao@moranguete.com", tipo: .Instrutor)

print(catalogo.apresentar())

print("\n \(Aluno1.descricao())")
print("\n \(Aluno2.descricao())")

print("\n \(ProfessorMusculacao1.descricao())")