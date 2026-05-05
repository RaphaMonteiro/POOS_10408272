import Foundation

enum ExperienciaNivel:String {
	case Iniciante = "Iniciante"
	case Intermediario = "Intermediario"
	case Avançado = "Avançado"
	}
		
enum tipoUser:String{
	case Aluno = "Aluno"
	case Instrutor = "Instrutor"
	}

class User {
	let nome: String
	private var email: String
	let tipo : tipoUser
    private let id : UUID
	
	init(nome:String, email:String , tipo : tipoUser){
        self.nome = nome
        self.email = email
        self.tipo = tipo
        self.id = UUID()
        }
    
    func getEmail() ->String{
        return self.email
    }
    func setEmail(email:String){
        self.email = email

    }
    func getId()->UUID{
        return self.id
    }
    func descricao() -> String {
        return """
        Id: \(self.getId())
        Nome: \(self.nome)
        Email: \(self.getEmail())
        Tipo: \(self.tipo)
        """
    }
}
