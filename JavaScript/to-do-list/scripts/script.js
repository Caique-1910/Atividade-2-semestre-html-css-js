//Varivel para armazenar o form
const elForm = document.getElementById('form-tarefa')

//Varivel para armazeanar o titulo(input)
const elTitulo = document.querySelector('#titulo')

//Varivael para armazenar o filtro de status
const elFiltroStatus = document.querySelectorAll('#filtro-status')

//Variavel para armazenar o filtro de busca
const elFiltroBusca = document.querySelector('#filtro-busca')

//Variavel para armazenar a lista
const elLista = document.querySelector('#lista-tarefas')

//Variavel para armazenar o texto que aparece quando a lista esta vazia
const elVacio = document.querySelector('#vazio')

//Lista de tarefas inicial
let tareas = [
    { id: 1, titulo: "Estudar DOM", status: "pendente" },
    { id: 2, titulo: "Criar to-do list", status: "andamento" },
    { id: 3, titulo: "Estudar Js", status: "concluido" }
]

// Adiciona um "ouvinte" para o evento de submit do formulario
elForm.addEventListener("submit", function (e) {
    //letra "e" na funcao: e uma referencia ao objeto de evento
    // que o navegador cria sempre que algo acontece

    //Impede o comportamento padrao do formulario(recarregar a pagina)
    e.preventDefault();

    //Pega o valor digitado no input, removendo espacos
    const titulo = elTitulo.value.trim()

    //Se o titulo estiver vazio, encerra a funcao
    if (!titulo) return
    // console.log("Titulo inserido pelo usuario: ", titulo)

    //Cria um objeto representando a nova tarefa
    // id recebe o numero timestamp atual
    // titulo recebe o texto digitado pelo usuario
    // status comeca sempre PENDENTE
    const nuevo = { id: Date.now(), titulo: titulo, status: "pendente" }

    //Adiconar a nova tarefa dentro do array de tarefas
    tareas.push(nuevo)

    //Limpa o campo de texto do input
    elTitulo.value = ""

    // Chama a funcao render para atualizar a lista de tarefas exibida na tela
    render();

})

// Renderizar a lista
function render() {
    // termo digitado na busca - deixar minusculo //(termino == termo em espanhol)
    const termino = elFiltroBusca.value.toLowerCase();
    // console.log("Termo digitado em minusculo: ", termino)

    // Valor selecionado no filtro de status
    const filtro = elFiltroStatus.value;
    // console.log("Filtro de status: ", filtro)

    // Aplica filtros de status e busca
    const filtradas = tareas.filter(function (t) {

        // Se filtro for "todas", aceita qualquer status, senao compara com t.status
        const okStatus = filtro === "todas" ? true : t.status === filtro

        //se houver um termo, verifica se titulo contem esse termo
        //se usuario digitar algo, so aceita a tarefa se ofr ao que usuario digitou
        //se usuario nao digitar nada retorna a lista completa(true)
        const okBusca = termino ? t.titulo.toLocaleLowerCase().includes(termino) : true
        return okStatus && okBusca
    })
    
    //Limpar a lista antes de redesenhar
    elLista.innerHTML = ""

    //cria os elementos da lista para cada tarefa filtrada
    filtradas.forEach(function(t){
        // <li class="tarefa {status} data-id={id}"></li>
        const li = document.createElement('li')
        //class=" tarefa concluida"
        li.className = "tarefa "+ t.status
        li.dataset.id = t.id

        //titulo da tarefa
        const h3 = document.createElement('h3')
        //<h3>Aula de js</h3>
        h3.textContent = t.titulo

        //Criar uma caixa de acoes (checkbox, select , botao remover)
        const acciones = document.createElement('div')
        acciones.className = "acao"

        //checkbox: marcar concluida/pendente 
        const check = document.createElement(input)
        check.type = "checkbox"
        check.checked = t.status === "concluida"
    })
}




