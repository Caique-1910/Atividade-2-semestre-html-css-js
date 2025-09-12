//* Variavel para armazenar o form
// document eh uma funcao que busca conteudo no HTML, .getElementeById busca o nome da div(ID)
const elForm = document.getElementById('form-tarefa')

//* Variavel para armazenar titulo da tarefa (input)
// querySelector() busca elemento HTML(div) mesclado com CSS
// se uso o # porque ele eh um id, caso fosse uma classe seria .
const elTitulo = document.querySelector('#titulo')

//* Variavel para armazenar filtro de status
const elFiltroStatus = document.querySelector('#filtro-status')

//* VAriavel para armazenar filtro de busca
const elFiltroBusca = document.querySelector('#filtro-busca')


//* Variavel para armazenar uma lista de tarefas
const elLista = document.querySelector('#lista-tarefas')

//* variavel aparece par armazenar o texto que aparece quando a lista esta vazia
const elVazio = document.querySelector('#vazio')

let tarefas = [
    {id: 1, titulo: "Estudar DOM", status: "pendente"},
    {id: 2, titulo: "Criar To-DO-List", status:"andamento"},
    {id: 3, titulo: "Praticar JavaSCript", status: "concluida"}
]

//* Adiciona um "ouvinte" para o evento de submit do formulario
// .addEventListenr faz com que voce adicione um evente ao ouvinte, quer dizer que fara um evento caso houver listener
elForm.addEventListener('submit', function(e){
    //letra "e" na funcao : eh uma referencia ao objeto de evento que o navegador cria sempre que algo acontece

    //*Impede o compotamento padrao do formulario(recarregar a pagina)
    e.preventDefault();

    //* Pega o valor(value) digitado no input(elTitulo) e o trim() tambem eh usado no JS, apagando todos os espacos a mais desnecessarios
    const titulo = elTitulo.value.trim();
    
    //* Se o titulo estive vazio, encerra a funcao aqui
    if(!titulo) return;

    console.log("titulo: " + titulo)

    //* Cria um objeto representado a nova tarefa
    //* - id: recebe o numero do timestamp
    //* - titulo: recebe o texto digitado pelo usuario
    //* - status: comeca sempre como "pendente"
    const nova = {id: Date.now(), titulo: titulo, status: "pendente"}

    //* Adiciona a nova tarefa dentro da array de tarefas
    tarefas.push(nova);

    console.log(tarefas);

    //* Limpa o campo de texto do input
    elTitulo.value = ""

    // Chama a funcao lista render() para atualizar a lista de tarefas exibida na tela
    render();
})

//* Rederizar a lista
function render(){
    // termo digitado na busca
    const termo = elFiltroBusca.value.toLowerCase();

    // valor selecionado no filtro de status
    const filtro = elFiltroStatus.value;
    //console.log("filtro de status: ", filtro)

    //* aplica filtro de status e busca
    const filtradas = tarefas.filter( t => {
        //* Se filtro for igual a "todas", aceita qualquer status
        //* Se nao - compara com t.status

        const okStatus = filtro === "todas" ? true : t.status === filtro;

        //* se houver termo, verifique se titulo contem esse termo
        //* se usuario digitar  algo, so aceita tarefa se for igual ao que o usuario digitou
        const okBusca =  termo ? t.titulo.toLocaleLowerCase().includes(termo) : true

        return okStatus && okBusca
    })

    //* limpar a lista antes de redesenhar
    elLista.innerHTML = "";

    //* Cria os elementos da lista para cada tarefa filtrada
    filtradas.forEach(function(t){
        //* <li class"tarefa {status}" data id
        const li = document.createElement('li')
        li.className = "tarefa " + t.status;
        li.dataset.id = t.id;

        //* titulo da tarefa
        const h3 = document.createElement('h3')
        //* <h3>Aula JavaScript</h3>
        h3.textContent = t.titulo;

        //* caixinha de acoes (checkbox, select, botao remover)
        const acoes = document.createElement('div')
        acoes.className = "acao";

        //* Checkbox: marcar concluida/pendente
        const check = document.createElement('input')
        check.type = "checkbox"
        check.checked = t.status === "concluida";
        
        //* ao mudar o check, redesenha na tela
        check.addEventListener('change', t => {
            t.status = check.checked ? "concluida" : "pendente"
            render();
        })

        //* select de status: pendente / concluida / andamento
        const select =  document.createElement('select')
        const listaSelect = ["pendente", "andamento", "concluida"]

        listaSelect.forEach(status => {
            const option = document.createElement('option')
            option.value = status

            option.textContent = status.charAt(0).toUpperCase() + status.slice(1);

            if(t.status === status) option.selected = true;
            // .appendChild() poe o filho dentro do objeto
            select.appendChild(option);

            //? Abaixo sao apenas exemplos de funcoes para a didatica, nao tem nenhuma relevancia no codigo
            // .textContente poe um texto no conteudo
            // charAt(numero) mostra a letra posicionada de acordo com o numero
            let primeiraMaiuscula = status.charAt(0).toUpperCase()

            // Escreve a palavra a partir na posicao emposta
            let sliceNoStatus = status.slice(0)

            let palavraCompleta = primeiraMaiuscula + sliceNoStatus;


        })

        //* ao mudar o select, atualiza e redenha na tela
        select.addEventListener('change', function(){
            t.status = select.value
            render()
        })

            //* Botao remover
            const botao = document.createElement('botton')
            botao.textContent = "X"
            botao.className = "remover"

            botao.addEventListener('click', function() {
                tarefas = tarefas.filter(apagar => apagar.id !== t.id)
                render()
            })

            //* Adicionando os filhos da div acao
            acoes.appendChild(check)
            acoes.appendChild(select)
            acoes.appendChild(botao)

            //* Adicionando os filhos da li
            li.appendChild(h3)
            li.appendChild(acoes)

            //*adicionando os filhos fo ul (#id: lista-tarefas - variavel elLista)
            elLista.appendChild(li)
    })

    //* Texto aparece soemente se o array de filtragem existit algo
    //* caso contrario, recebe display: none (some da tela)
    elVazio.style.display = filtradas.length ? "none" : "block"
}

//* Quando o usuario mudar a opcao de filtro por status
elFiltroStatus.addEventListener('change', render)

//* Quando o usuario digitar algo no campo de busca
elFiltroBusca.addEventListener('input', render)

//* primeira renderizacao / atualizacao de informascoes
render()