import Foundation

print("Dia 3 de Swift!!")


let unidade = Unidade.shared


if unidade.catalogo.criar(nome: "Mensal", 
                        valorMensalidade: 120, 
                        possuiPersonal: false , 
                        limAulasDiaria: 1,
                         validadeMensalidade: 30){
    print("Plano criado")
                         }else{
                            print("erro ao tentar criar plano")
                         }
if unidade.catalogo.criar(nome: "Trimestral", 
                        valorMensalidade: 110, 
                        possuiPersonal: false, 
                        limAulasDiaria: 2, 
                        validadeMensalidade: 90){
    print("Plano criado")
                         }else{
                            print("erro ao tentar criar plano")}
if unidade.catalogo.criar(nome: "Semestral", 
                        valorMensalidade: 100, 
                        possuiPersonal: true,
                        limAulasDiaria: 3,
                        validadeMensalidade: 180){
    print("Plano criado")
                         }else{
                            print("erro ao tentar criar plano")}

print("\ntentar criar um plano que ja foi criado = \n")
if unidade.catalogo.criar(nome: "Mensal", 
                        valorMensalidade: 120, 
                        possuiPersonal: false , 
                        limAulasDiaria: 1,
                         validadeMensalidade: 30){
    print("Plano criado")
                         }else{
                            print("erro ao tentar criar plano")
                         }



var moranguete = Aluno(nivel: .Iniciante, nome: "Moranguete", email: "Moranguete@Moranguete.com", tipo: .Aluno)

if unidade.addAluno(aAluno:moranguete){
    moranguete.addPlano(planoAluno: "Semestral")
    moranguete.plano!.addModalidade(categoria:CategoriasAulas.allCases)

    print("\nDescrição Moranguete\n")
    print(moranguete.descricao())
}else{
    print("erro ao adicionar aluno")
}



if let bananalId = unidade.criarAluno(nivel: .Iniciante, nome: "Bananal", email: "Bananal@Moranguete.com", tipo: .Aluno){
    if let bananal = unidade.getAluno(id: bananalId){ 
    bananal.addPlano(planoAluno: "Mensal")
    bananal.plano!.addModalidade(categoria:[.Musculacao])
    print("Descrição Bananal")
    print(bananal.descricao())
    }else{
        print("erro ao criar aluno")
    }

}

print("\nTentar add Moranguete novamente = \n")
if unidade.addAluno(aAluno:moranguete){
    moranguete.addPlano(planoAluno: "Semestral")
    moranguete.plano!.addModalidade(categoria:CategoriasAulas.allCases)

    print("\nDescrição Moranguete\n")
    print(moranguete.descricao())
}else{
    print("erro ao adicionar aluno")
}

print("\nTentar criar moranguete depois de adicionada= \n")
if let morangueteId = unidade.criarAluno(nivel: .Iniciante, nome: "Bananal", email: "Bananal@Moranguete.com", tipo: .Aluno){
    if let moranguete = unidade.getAluno(id: morangueteId){ 
    moranguete.addPlano(planoAluno: "Mensal")
    moranguete.plano!.addModalidade(categoria:[.Musculacao])
    print("Descrição Bananal")
    print(moranguete.descricao())
    }else{
        print("erro ao criar aluno")
    }
}


let ProfessorMusculacao1 = Instrutor(especialidade: .Musculacao, nome: "Abacatudo", email: "abacatudo@moranguete.com", tipo: .Instrutor)
let ProfessorYoga = Instrutor(especialidade:.Yoga, nome: "yogat", email: "yogatudo@moranguete.com", tipo: .Instrutor) 

print("Planos Disponiveis: \n")
print(unidade.catalogo.apresentar())


print("Descrição Instrutores: \n")
print("\n \(ProfessorMusculacao1.descricao())")
print("\n \(ProfessorYoga.descricao())")







