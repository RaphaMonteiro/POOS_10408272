import Foundation

print("Dia 3 de Swift!!")


let unidade = Unidade.shared

let catalogo = Unidade.
catalogo.criar(nome: "Mensal", valorMensalidade: 120, possuiPersonal: false , limAulasDiaria: 1, validadeMensalidade: 30)
catalogo.criar(nome: "Trimestral", valorMensalidade: 110, possuiPersonal: false, limAulasDiaria: 2, validadeMensalidade: 90)
catalogo.criar(nome: "Semestral", valorMensalidade: 100, possuiPersonal: true, limAulasDiaria: 3, validadeMensalidade: 180)

let Aluno1 = Aluno(nivel: .Iniciante, nome: "Cau", email: "cau@cacau.cau", tipo: .Aluno)

Aluno1.addPlano(planoAluno: "Mensal")


Aluno1.addModalidade(CategoriaAulas.allCases)


let Aluno2 = Aluno(nivel: .Intermediario, nome: "COCAU", email: "COCAU@COCAU.cau", tipo: .Aluno)

Aluno2.addPlano(planoAluno: "Trimestral")
Aluno2.addModalidade(.Musculação)

let ProfessorMusculacao1 = Instrutor(especialidade: .Musculação, nome: "Abacatudo", email: "abacatudo@moranguete.com", tipo: .Instrutor)

print(catalogo.apresentar())

print("\n \(Aluno1.descricao())")
print("\n \(Aluno2.descricao())")

print("\n \(ProfessorMusculacao1.descricao())")