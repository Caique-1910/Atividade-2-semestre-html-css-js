//fot
//contando de 1 ate n
// let n = parseInt(prompt("Digite um numero: "))

// for(let i = 1; i <= n; i++){
//     console.log(i)
// }

// for(let i = 1; i >= 0; i--){
//     console.log(i)
// }

//While
//Fazer soma

// let soma = 0
// let i = 1

// while(i <= 10){
//     soma += i
//     // soma = soma + i
//     console.log("O resultado atual é: " + soma)
//     i++
// }

// console.log("A soma total dos 10 numeros e: " + soma)

// Do While
//Garante a execucao pelo menos 1 vez
// let numero = 6

// do {
//     console.log("Numero: " + numero)
//     numero++
// } while (numero <= 5)


//Foreach
let numeros = [1, 2, 3, 4, 5]

// numeros.forEach(function (numero) {
//     console.log("Numero: " + numero)
// })

// let frutas = ["Banana", "Maçã", "Uva", "Pera"]

// frutas.forEach(function (fruta) {
//     console.log(fruta)
// })  

for (let i = 0; i < numeros.length; i++) {
    console.log("Numero: " + numeros[i])
}