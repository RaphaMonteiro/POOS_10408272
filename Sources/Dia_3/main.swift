import Foundation

print("Dia 3 de Swift!!")


let unidade = Unidade.shared
unidade.reset()
//print(unidade.getAlunos())



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



var moranguete = Aluno(nivel: .Iniciante, nome: "Moranguete", email: "Moranguet@Moranguete.com", tipo: .Aluno)

print("\nTentar adicionar Moranguete = ")
if unidade.addAluno(aAluno:moranguete){
    moranguete.addPlano(planoAluno: "Semestral")
    moranguete.plano!.addModalidade(categoria:CategoriasAulas.allCases)

    print("\nDescrição Moranguete\n")
    print(moranguete.descricao())
    print("\n Moranguete adicionado com sucesso")
}else{
    print("\nerros ao adicionar aluno")
}


print("\nTentar criar Aluno Bananal = ")




if let bananalId = unidade.criarAluno(nivel: .Iniciante, nome: "Bananal", email: "Bananal@Moranguete.com", tipo: .Aluno){
    
    if let bananal = unidade.getAluno(id: bananalId){ 
        
        bananal.addPlano(planoAluno: "Mensal")
        bananal.plano!.addModalidade(categoria:[.Musculacao])
        print("Descrição Bananal")
        print(bananal.descricao())
        print("\n Bananal criado com sucesso")
    }else{
        print("erro ao criar aluno")
    }
}else{
    print("\n erro ao criar aluno")
}

print("\nTentar add Moranguete novamente = ")
if unidade.addAluno(aAluno:moranguete){
    moranguete.addPlano(planoAluno: "Semestral")
    moranguete.plano!.addModalidade(categoria:CategoriasAulas.allCases)

    print("\nDescrição Moranguete\n")
    print(moranguete.descricao())
}else{
    print("\nerros ao adicionar aluno")
}

print("tentar encontrar moranguete por id: \n")
guard let moranguete = unidade.getAluno(id:moranguete.getId()) else {
    print("\nMoranguete não encontrado")
    exit(1)
}

print("tentar encontrar bananal por email: \n")

guard let bananal = unidade.getAlunoEmail(email: "Bananal@Moranguete.com") else {
    print("\nBananal não encontrado")
    exit(1)
}




print("\nTentar criar moranguete depois de adicionada= ")
if let morangueteId = unidade.criarAluno(nivel: .Iniciante, nome: "Bananal", email: "Bananal@Moranguete.com", tipo: .Aluno){
    if let moranguete = unidade.getAluno(id: morangueteId){ 
        moranguete.addPlano(planoAluno: "Mensal")
        moranguete.plano!.addModalidade(categoria:[.Musculacao])
        print("Descrição Bananal")
        print(moranguete.descricao())
    }else{
        print("erro aoprocurar aluno")
        }
}else{
        print("\nAluno ja existe, erro ao criar aluno")
    }



let ProfessorMusculacao1 = Instrutor(especialidade: .Musculacao, nome: "Abacatudo", email: "abacatudo@moranguete.com", tipo: .Instrutor)
let ProfessorYoga = Instrutor(especialidade:.Yoga, nome: "yogat", email: "yogatudo@moranguete.com", tipo: .Instrutor) 

print("Planos Disponiveis: \n")
print(unidade.catalogo.apresentar())


print("Descrição Instrutores: \n")
print("\n \(ProfessorMusculacao1.descricao())")
print("\n \(ProfessorYoga.descricao())")



print("\nAgendamento elegivel: \n")
print("Moranguete agendando Musculação, Modalidades Moranguete: ")
print((moranguete.plano!.listarModalidade()))

if unidade.agendarAulaPersonal(categoria: .Musculacao, aluno: moranguete, instrutor: ProfessorMusculacao1, data: Date()){
    print("Agendamento realizado")
}else{
    print("Agendamento não realizado")
}



print("\nAgendamento não elegivel: \n")



print("Bananal agendando Yoga: Modalidades Bananal:  \n")
print(bananal.plano!.listarModalidade())

if unidade.agendarAulaPersonal(categoria: .Yoga, aluno: bananal, instrutor: ProfessorYoga, data: Date()){
    print("Agendamento realizado")
}else{
    print("Agendamento não realizado")
}


print("\nListar Agendamentos Personal: \n")
print(unidade.listarAgendamentos())


print("Iniciando Lote de Manutenção: \n")

let defeituoso = unidade.loteManutencao()

if defeituoso.isEmpty{
    print("Nenhuma máquina defeituosa")
}else{
    print("Máquinas defeituosas: \n")
    for m in defeituoso{
        print("- \(m.nomeMaquina)")
    }
}




