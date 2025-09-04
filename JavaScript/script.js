// console.log("Hello, World!")
// const message = "Hello, World!"
// let variavel = 1
// console.log(variavel === 1)
// console.log(0 === false)
// console.log("" == 0)
// console.log("" == false)
// console.log("" === 0)
// console.log("1" == true)
// console.log("3" == true)
// console.log("1" + "banana")
// console.log("1" - "banana")
// console.log([] + {})
// console.log(0 == 0)
// console.log(1 / 0)
// console.log(1 / -0)
// console.log({} == false)
// console.log({} == false)
// let variavelA = 10
// let variavelB = 20
// if (variavelA < variavelB)
//     console.log("A é menor que B")
// let nome = "Caique"
// let idade = 17
// console.log("Ola, meu nome e " + nome + " e tenho " + idade + " anos.")
// let mensagem = `Ola, meu nome e ${nome} e tenho ${idade} anos.`
// // alert(mensagem);
// console.log(typeof mensagem); //String
// console.log(typeof idade); //Number
// let profissao
// console.log(typeof profissao); // undefined
// let endereco = null
// console.log(typeof endereco) // null

//Estrutura Condicional

//  if/else
// let temperatura = 12
// if (temperatura > 25){
//     console.log("Esta calor")
// }
// else{
//     console.log("Esta frio")
// }

// let nome2 = prompt("Digite seu nome: ")
// alert("Seu nome e " + nome2)


// IF / ELSE IF / ELSE

// let nota = parseInt (prompt("Digite sua nota: "))

// if (nota > 6){
//     console.log("Aprovado")
// } else if (nota >= 5){
//     console.log("Recuperacao")
// } else{
//     console.log("Reprovado")
// }


// if ternario

// let saldo = 90
// let podeComprar = saldo >= 100 ? "Compra aprovada" : "Saldo insuficiente"
// console.log(podeComprar)

// Condiacionais aninhadas
// Multiplas verificacoes
// let hora = 8
// let diaDaSemana = "terca"

// if (hora >= 6 && hora < 12) {
//     console.log("Bom dia")
// } else {
//     if (hora >= 12 && hora < 18) {
//         console.log("Boa tarde")
//         if (diaDaSemana == "segunda") {
//             console.log("Boa tarde, otima semana")
//         } else {
//             console.log("Boa tarde")
//         }
//     } else {
//         console.log("Boa noite")
//     }

// }

// switch case

let dia = 3

switch (dia) { 
    case 1:
        console.log("Domingo")
        break
    case 2:
        console.log("Segunda")
        break
    case 3: 
        console.log("Terca")
        break
    case 4:
        console.log("Quarta")
        break
    case 5:
        console.log("Quinta")
        break
    case 6:
        console.log("Sexta")
        break
    case 7:
        console.log("Sabado")
        break
    default:
        console.log("Dia invalido")                        
}