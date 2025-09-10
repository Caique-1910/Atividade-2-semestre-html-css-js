//Nivel basico

//Exercicio 1
// let numero = 0
// for (let i = 1; i <= 10; i++) {
//     numero = i
//     console.log("Numero: " + numero);
// }

//Exercicio 2
// let numero = prompt("Digite um numero: ")
// for (let i = 1; i <= 10; i++) {
//     let resultado  = numero * i
//     console.log("Numero: " + resultado);
// }

//Exercicio 3
// let n = parseInt(prompt("Digite um numero: "))
// let valorSomaDosN = 0
// while (valorSomaDosN < n) {
//     for (let i = 1; i <= n; i++) {
//         valorSomaDosN += i
//     }
//     console.log("Soma: " + valorSomaDosN);
// }

//Nivel intermediario
//Exercicio 1
// for (let i = 1; i <= 50; i++) {
//     if (i % 2 === 0) {
//         console.log(i + " é par");
//     }
// }

//Exercicio 2
// let randomNumber = Math.floor(Math.random() * 100) + 1
// let acertou = false

// while (!acertou) {
//     let userNumber = parseInt(prompt("Digite um numero entre 1 e 100: "))
//     if (userNumber === randomNumber) {
//         acertou = true
//         console.log("Parabens voce acertou o numero: " + randomNumber);
//     } else if (userNumber < randomNumber) {
//         console.log("Tente um numero maior");
//     } else {
//         console.log("Tente um numero menor");
//     }
// }

//Exercicio 3

// let numero = parseInt(prompt("Digite um numero: "))
// while (numero){
//     numero --
//     console.log(numero);
//     if(numero === 0){
//         console.log("Fim");
//     }
// }

//Nivel avancado
//Exercicio 1
// let numero = prompt("Digite um numero: ")
// let somaDosDigitos = 0
// let verificao = 0
// numero = numero.split('')
// while (verificao === 0) {
//     for (let i = 0; i < numero.length; i++) {
//         somaDosDigitos += Number(numero[i])
//     }
//     console.log("Soma dos digitos: " + somaDosDigitos);
//     verificao = 1
// }

//Exercicio 2
// let numero = parseInt(prompt("Digite um numero: "))
// let fatorial = 1
// for (let i = numero; i > 1; i--) {
//     fatorial *= i
// }
// console.log("Fatorial de " + numero + " é: " + fatorial);

//Exercicio 3
// let numero = prompt("Digite um numero: ")
// let numeroInvertido = ""
// let verificao = 0
// while (verificao === 0) {
//     for (let i = numero.length - 1; i >= 0; i--) {
//         numeroInvertido += numero[i]
//     }
//     console.log("Numero invertido: " + numeroInvertido);
//     verificao = 1
// }


//Exercicio 4

// let numeros = parseInt(prompt("Digite um numero: "))
// let armazenarNumerosPerfeitos = []
// for (let i = 1; i <= numeros; i++) {
//      for (let i = 1; i <= numeros; i++) {
//           let verificaoDeNumeroPerfeito = 0
//           for (let j = 1; j < i; j++) {
//                if (i % j === 0) {
//                     verificaoDeNumeroPerfeito += j
//                }
//           }
//           if (verificaoDeNumeroPerfeito === i) {
//                armazenarNumerosPerfeitos.push(i)
//           }

//      }
// }

// console.log("Numeros perfeitos: " + armazenarNumerosPerfeitos);