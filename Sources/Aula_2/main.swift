import Foundation

print("Aula 2 de Swift!!")

var formatter = DateFormatter()
formatter.dateFormat = "dd-MM-yyyy" 

var today = formatter.string(from: Date())

print(today)