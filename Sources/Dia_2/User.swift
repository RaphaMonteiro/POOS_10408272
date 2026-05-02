import Foundation
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
