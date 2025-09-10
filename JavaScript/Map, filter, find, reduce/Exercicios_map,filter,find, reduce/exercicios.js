//Filter

//Exercicio 1

// const notas = [4, 7, 9, 3, 10, 5]
// const notasMaiores = notas.filter(auxiliar => auxiliar > 7)
// console.log(notasMaiores)

//Exercicio 2
// const palavras = ["sol", "mar", "computador", "lua", "codigo"]
// const filtro = palavras.filter(auxiliar => auxiliar.length > 4)
// console.log(filtro)

//Exercicio 3
// const animais = ["gato", "cachorro", "peixe", "elefante", "abelha"]
// const filtro = animais.filter(auxiliar => auxiliar.startsWith("c"))
// console.log(filtro)

//Find

//Exercicio 1
// const filmes = ["Avatar", "Batman", "Vingadores", "Matrix", "Barbie"]
// const primeiroFilmeB =  filmes.find(auxiliar=> auxiliar.startsWith("B"))
// console.log(primeiroFilmeB)


//Exercicio 2
// const numeros = [2, 4, 6, 9, 12, 15]
// const impar = numeros.find(auxiliar => auxiliar%2!==0)
// console.log(impar)

//Exercicio 3
// const alunos = [
//     {nome: "Ana", nota: 8},
//     {nome: "Carlos", nota: 5},
//     {nome: "Beatriz", nota: 9}
// ]
// const maiores = alunos.find(auxiliar => auxiliar.nota > 7)
// console.log(maiores)


//Map

//Exercicio 1
// const temperaturas = [20, 25, 30, 15]
// const converter = temperaturas.map(conversor => conversor  * 1.8 + 32)
// console.log(converter)

//Exercicio 2
// const produtos = ["camisa", "calca", "sapato"]
// const maiusculo = produtos.map(auxiliar =>"Produto: " + auxiliar.toUpperCase())
// console.log(maiusculo)

//Exercicio 3
// const numeros = [1, 2, 3, 4]
// const quadrado = numeros.map(auxiliar=> auxiliar**2)
// console.log(quadrado)

//Reduce

//Exercicio 1
// const valores = [100, 200, 50, 150]
// const total = valores.reduce((acumulador, auxiliar)=> acumulador + auxiliar, 0)
// console.log(total)

//Exercicio 2
// const palavras = ["Js ", "e ", "muito ", "legal"]
// const frase = palavras.reduce((acumulador, auxiliar)=> acumulador + auxiliar, )
// console.log(frase)

//Exercicio 3
// const numeros = [1, 2, 3, 4, 5]
// const media = numeros.reduce((total, numero)=> total + numero, 0)/ numeros.length
//  console.log(media)

//Desafios

//Desafio 1
// const livros = [
//     { titulo: "Dom Casmurro", paginas: 300 },
//     { titulo: "O Hobbit", paginas: 295 },
//     { titulo: "A Revolução dos Bichos", paginas: 112 }
// ]
// const paginas = livros.filter(auxiliar => auxiliar.paginas > 200)
// console.log(paginas)
// const titulos = livros.map(auxiliar => auxiliar.titulo)
// console.log(titulos)
// const total = livros.reduce((acumulador, auxiliar)=> acumulador + auxiliar.paginas, 0)
// console.log(total)


//Desafio 2
// const carrinho = [
//     { produto: "Notebook", preco: 2500 },
//     { produto: "Mouse", preco: 100 },
//     { produto: "Teclado", preco: 200 }
//   ];
// const lista = carrinho.map(auxiliar =>" Produto: " + auxiliar.produto + " R$ " + auxiliar.preco)
// console.log(lista)
// const total = carrinho.reduce((acumulador, auxiliar)=> acumulador + auxiliar.preco, 0)
// console.log(total)
// const encontro = carrinho.find(auxiliar=>auxiliar.produto=="Mouse")
// console.log(encontro)
