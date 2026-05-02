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