//Nivel basico
//Exercicio 1

// let idade = prompt("Digite sua idade:")
// if (idade >= 18) {
//     console.log("Você é maior de idade.")
// }
// else {
//     console.log("Você é menor de idade.")
// }

//Exercicio 2
// let number = prompt("Digite um número:")
// if (number > 0) {
//     console.log("O número é positivo.")
// }
// else {
//     console.log("O número é negativo.")
// }

//Exercicio 3
// let nota = prompt("Digite sua nota (0 a 100):")
// if (nota >= 60) {
//     console.log("Aprovado")
// }
// else {
//     console.log("Reprovado")
// }

//Exercicio 4
// let numero = prompt("Digite um número:")
// if (numero > 0) {
//     console.log("Positivo")
// }
// else if (numero < 0) {
//     console.log("Negativo")
// }
// else {
//     console.log("Zero")
// }

//Exercicio 5
// let idade = prompt("Digite sua idade:");
// if (idade <= 12) {
//     console.log("Criança")
// }
// else if (idade >= 13 && idade < 18) 
//     {
//     console.log("Adolescente")
// }
// else {
//     console.log("Adulto")
// }

//Exercicio 6
// let numero = prompt("Digite um número:")
// if (numero % 2 === 0) {
//     console.log("E divisivel por 2")
// }

//Nivel Intermediario

//Exercicio 1
// let numero1 = parseFloat(prompt("Digite o primeiro número:"))
// let numero2 = parseFloat(prompt("Digite o segundo número:"))
// if (numero1 + numero2 > 100) {
//     console.log("A soma é maior que 100.")
// }
// else {
//     console.log("A soma é menor ou igual a 100.")
// }

//Exercicio 2
// let numero1 = parseFloat(prompt("Digite o primeiro número:"))
// let numero2 = parseFloat(prompt("Digite o segundo número:"))
// let numero3 = parseFloat(prompt("Digite o terceiro número:"))

// if(numero1 > numero2 && numero2 > numero3){
//     console.log("Numero 1 e maior")
// }
// else if(numero2 > numero1 && numero2 > numero3){
//     console.log("Numero 2 e maior")
// }
// else if(numero3 > numero1 && numero3 > numero2){
//     console.log("Numero 3 e maior")
// }

//Exercicio 3

// let valorCompra = parseFloat(prompt("Digite o valor da compra:"))
// if(valorCompra > 100){
//     let desconto = valorCompra * 0.10
//     let valorFinal = valorCompra - desconto
//     console.log("Valor com desconto: " + valorFinal.toFixed(2))
// }
// else{
//     console.log(`${valorCompra.toFixed(2)}`)
// }

//Exercicio 4
// let usuario = prompt("Digite seu nome:")
// let senha = prompt("Digite sua senha:")
// if(usuario == "admin" && senha == "1234"){
//     console.log("Acesso permitido")
// }
// else{
//     console.log("Acesso negado")
// }


//Nivel Avancado

//Exercicio 1
// let lado1 = parseFloat(prompt("Digite o comprimento do lado 1:"))
// let lado2 = parseFloat(prompt("Digite o comprimento do lado 2"))
// let lado3 = parseFloat(prompt("Digite o comprimento do lado 3:"))

// if(lado1 === lado2 && lado2 === lado3) {
//     console.log("Triângulo Equilátero")
// }
// else if(lado1 === lado2 || lado1 === lado3 || lado2 === lado3) {
//     console.log("Triângulo Isósceles")
// }
// else {
//     console.log("Triângulo Escaleno")
// }

//Exercicio 2
// let nota = parseFloat(prompt("Digite sua nota (0 a 100):"))
// if(nota >= 90 && nota <= 100) {
//     console.log("A")
// }
// else if(nota >= 80 && nota < 89) {
//     console.log("B")
// }
// else if(nota >= 70 && nota < 79) {
//     console.log("C")
// }
// else if(nota >= 60 && nota < 69) {
//     console.log("D")
// }
// else if(nota <60) {
//     console.log("F")
// }
// else {
//     console.log("Nota inválida")
// }

//Exercicio 3
// let peso = parseFloat(prompt("Digite seu peso em kg:"))
// let altura = parseFloat(prompt("Digite sua altura em metros:"))
// let imc = peso / (altura * altura)

// if(imc < 18.5) {
//     console.log("Abaixo do peso")
// }
// else if(imc >= 18.5 && imc < 24.9) {
//     console.log("Peso normal")
// }
// else if(imc >= 25 && imc < 29.9) {
//     console.log("Sobrepeso")
// }
// else if(imc >= 30 && imc < 34.9) {
//     console.log("Obesidade grau 1")
// }
// else if(imc >= 35 && imc < 39.9) {
//     console.log("Obesidade grau 2")
// }
// else {
//     console.log("Obesidade grau 3")
// }

///Exercicio 4
// let ano = parseInt(prompt("Digite um ano:"))
// if((ano % 4 === 0 && ano % 100 !== 0) || (ano % 400 === 0)) {
//     console.log("Ano bissexto")
// }
// else {
//     console.log("Ano não bissexto")
// }