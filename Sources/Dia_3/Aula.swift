import Foundation

protocol Aula {
    var nome : String {get}
    var instrutor: String {get}
    var categoria: CategoriasAulas {get}

    func descricao() -> String
}

class turmaColetiva : Aula{
    var nome : String
    var instrutor: String
    var categoria: CategoriasAulas

    var minAlunos: Int
    var minElegivel: Bool = false
    var alunosInscritos: [Aluno] = []
    var maxAlunos: Int

    init(nome:String,instrutor:String,categoria:CategoriasAulas, maxAlunos:Int, minAlunos:Int){
        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.maxAlunos = maxAlunos
        self.minAlunos = minAlunos
    }

    func descricao() -> String {
        return """
        Nome = \(self.nome)
        Instrutor = \(self.instrutor)
        Categoria = \(self.categoria)
        """
    }

    func addAluno(aluno:Aluno)->Bool{
        if alunosInscritos.count<maxAlunos && !alunosInscritos.contains(where: { $0.getId() == aluno.getId()}){
            alunosInscritos.append(aluno)
            if alunosInscritos.count > self.minAlunos{
                self.minElegivel = true
            }
            return true

        }else{
            return false
        }
    }
}

class treinosPersonal : Aula {
    var nome : String
    var instrutor: String
    var categoria: CategoriasAulas

    init(nome:String,instrutor:String,categoria:CategoriasAulas){
        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
    }
    func descricao() -> String {
        return """
        Nome = \(self.nome)
        Instrutor = \(self.instrutor)
        Categoria = \(self.categoria)
        """
    }
}

