
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