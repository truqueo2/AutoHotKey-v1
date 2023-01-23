; A EXPLICAÇÃO DE CADA PARÂMETRO DE UM COMANDO ESTÁ SEPARADA POR UM PIPE |, E CADA PARÂMETRO ESTÁ DENTRO DOS PARÊNTESES.

#SingleInstance Force ; Após qualquer alteração ao executar o script, atualiza o automaticamente o script atual em execução, sem a necessidade de ficar confirmando.

FileSelectFolder, diretorio, C:, 0, Selecione um diretório para fazer a busca do formato desejado ; Exibe uma janela que permite ao usuário selecionar uma pasta. | (diretório) - nome da variável em que ficará armazenado a pasta que o usuário escolher | (C:) - Diretório escolhido para ser mostrado ao exibir a janela. Obs: Pode ser o de sua escolha. | (0) - Retira a opção do usuário poder criar uma pasta durante a seleção. Obs: Ver documentação para outras opções. | (Selecione um diretório para fazer a busca do formato desejado) - Descrição que aparecerá ao exibir a janela de seleção.

if (ErrorLevel) ; Caso o usuário pressione o botão Cancelar ou feche uma janela, (nesse caso a janela da linha 5), tudo que estiver dentro da abertura e fechamento de chaves (Linha 9), é executado, ou seja, caso o valor de ErrorLevel seja 1. (Sempre que o usuário não completar uma ação esperada, ou ocorrer algum erro, automaticamente a variável ErrorLevel vai receber o valor de 1).
{
    ExitApp ; Faz o script parar de executar (Fim da automação).
}

InputBox, formato, Localizador de Arquivos, Digite uma extensão para buscar,,250,130,,,,, Exemplo: txt`, jpg`, png`, gif`, exe`, etc... ; Cria uma janela em que o usuário pode digitar o formato do arquivo que deseja buscar no diretório selecionado (Linha 5). | (formato) - nome da variável em que ficará armazenado o formato que o usuário digitar. | (Localizador de Arquivos) - Título da janela. | (Digite uma extensão para buscar) - Descrição que aparecerá ao exibir a janela. | (250) - Largura da Janela. | (130) - Altura da janela. | (Exemplo: txt`, jpg`, png`, gif`, exe`, etc...) - Texto que aparecerá como dica. Obs: O acento ` serve para interpretar literalmente uma virgula, sem ele, o script interpretaria o que está depois da vírgula, como um próximo parâmetro.

formato := Trim(formato) ; Remove os espaços em branco se existir, do formato que o usuário digitou. | (Trim()) - Função que deve receber como parâmetro um texto ou uma variável em que se deseja remover espaços em branco. | (formato) - Variável em que está armazenado formato que o usuário digitou (Linha 12).

if formato is Space ; Verifica se o formato (Linha 12) que o usuário digitou não é apenas um espaço.
{
    ExitApp
}

if (formato = "" || formato = "Exemplo: txt, jpg, png, gif, exe, etc..." || ErrorLevel) ; |(If) - Inicia uma condição. Obs: Tudo que estiver dentro dos parênteses de abertura e fechamento do If(condições), será considerado como uma condição, dessa forma, podemos adicionar quantas condições quisermos. Nesse caso, o que separa cada condição são os dois pipes || (Podem ser substituídos por Or, ambos siginificam OU, isto é, caso qualquer uma das condições sejam verdadeiras, tudo que estiver dentro da abertura e fechamento de chaves {}, será executado. | (formato = "") - Caso o usuário pressione o botão OK com a caixa de texto vazia. | (formato = "Exemplo: txt, jpg, png, gif, exe, etc...) - Caso o usuário pressione o botão OK com o texto de exemplo. | (ErrorLevel) - Caso o usuário pressione o botão Cancelar ou feche a janela acima (Linha 12). Explicação detalhada sobre ErrorLevel na linha 7.
{
    ExitApp ; Faz o script parar de executar (Fim da automação).
}

arquivos := [] ; Faz a criação de uma Array vazia.

SetBatchLines, -1 ; Força o script a ler os arquivos na velocidade máxima.

ToolTip, Localizando arquivos... ; Exibe uma mensagem do lado ao cursor do mouse. | (Localizando arquivos...) - Mensagem que será exibida.

Loop, Files, %diretorio%/*.%formato%, R ; Faz um loop passando por cada arquivo dentro do diretório selecionado (Linha 5), apenas com o formato informado (Linha 12). | (Files) - Valor obrigatório para fazer um loop em arquivos. Obs: Para mais opções de loop, ver documentação. | (%diretório%) - Variável em que está armazenada a pasta que o usuário selecionou (Linha 5). | (%formato%) - Variável em que está armazenado o formato que o usuário digitou (Linha 12). | (R) - Faz o loop do diretório selecionado de forma recursiva, isto é, verifica dentro de cada subpasta existente.
{
    ToolTip % "Arquivos " . formato . " encontrados - " . A_Index ; Para cada arquivo encontrado, exibe uma mensagem ao lado do cursor do mouse, informando quantos arquivos foram localizados. | ("Arquivos ") - Um simples texto. | (formato) - Variável em que está armazenado formato que o usuário digitou (Linha 12). | (" encontrados - ") - Um simples texto. | (A_Index) - Variável de sistema que contém o número da volta atual do loop (Linha 25). | Obs: O ponto entre as informações, serve para concatenar (juntar) um valor com o outro, pois temos tipos de valores diferentes, simples textos(Strings), junto com variáveis.
    arquivos.Push(A_LoopFileFullPath) ; Para cada arquivo encontrado , insere o caminho da localização na Array "arquivos" (Linha 19). | (arquivos.Push()) - Função que deve conter como parâmetro tudo que queremos inserir na Array "arquivos" (Linha 19). | (A_LoopFileFullPath) - Variável de sistema que contém o caminho inteiro do arquivo atual de um loop do tipo Files (Linha 25).
}

ToolTip ; Desativa a última mensagem exibida ao lado do cursor do mouse.

if (arquivos[1]) ; Verifica se a Array "arquivos" (Linha 19), contém algum valor. | (arquivos[1]) - Retorna o primeiro valor da Array "arquivos" (Linha 19), caso exista um valor na Array "arquivos", isto é, se foi encontrado algum arquivo no formato buscado (Linha 12) e adicionado na Array "arquivos" (Linha 19), tudo que estiver dentro da abertura e fechamento de chaves (Linha 35 - 56), é executado, caso contrário, (Ver linha 59).
{

    MsgBox, 64, Sucesso, % "Foram encontrados " . arquivos.Length() . " arquivo(s) com o formato " . formato ; Exibe uma mensagem. | (64) - Exibe uma mensagem de informação, com o ícone de informação. | (Sucesso) - Título da mensagem. | ("Foram encontrados ") - Simples texto. | (arquivos.Length()) - Retorna o comprimento da Array "arquivos" (Linha 19), isto é, a quantidade de valores contidos na Array "arquivos" (Linha 19). | (" arquivo(s) com o formato ") - Um simples texto. | (formato) - Variável em que está armazenado o formato que o usuário digitou (Linha 12). Obs: O ponto entre as informações, serve para concatenar (juntar) um valor com o outro, pois temos tipos de valores diferentes, simples textos(Strings), junto com variáveis.

    MsgBox, 36, Aviso, Deseja visualizar os arquivos encontrados? ; Exibe uma mensagem. | (36) - Exibe as opções "SIM" e "NÃO", junto com o ícone de interrogação. | (Aviso) - Título da mensagem. | (Deseja visualizar os arquivos encontrados?) - Mensagem que será exibida para o usuário como pergunta.

    IfMsgBox, Yes ; Caso o usuário pressione "SIM", para a última mensagem, tudo que estiver dentro da abertura e fechamento de chaves (Linha 42 - 47), é executado, caso contrário, (Ver linha 49). | (Yes) - Opção selecionada para a condição. Obs: Para mais opções, ver documentação.
    {
        arquivo := FileOpen(A_ScriptDir . "\arquivos_" . formato . "localizados.txt", "W") ; Abre uma função para a leitura e escrita de arquivos de texto. | (arquivo) - Variável em que ficará armazenada a função FileOpen e seus parâmetros. | (FileOpen()) - Função que deve conter como parâmetro o nome do arquivo que desejamos abrir ou criar, para uso posterior. | (A_ScriptDir) - Variável de sistema que contém o caminho padrão de onde você está executando o script, então por exemplo, se você criou ou baixou essa automação na sua área de trabalho (Desktop), o arquivo "arquivos_formatoEscolhido_localizados.txt" (Linha 42), vai ser criado na sua área de trabalho. Dessa forma, você pode optar por ao invés de colocar "A_ScriptDir", colocar o caminho da localização do script. Exemplo: "C:\Users\usuario\Desktop", porém entre aspas, diferente do utilizado acima, ficaria: arquivo := FileOpen("C:\Users\usuario\Desktop"\arquivos" . formato . "localizados.txt", "W"). | ("\arquivos") - Primeira parte do nome que nosso arquivo de texto criado vai ter. | (formato) - Variável em que está armazenado formato que o usuário digitou (Linha 12). Obs: Segunda parte do nome que nosso arquivo de texto criado vai ter. | ("_localizados.txt") - Terceira parte do nome que nosso arquivo de texto criado vai ter. | ("W") - Opção que define que vamos criar um novo arquivo com o caminho especificado (Linha 42), ou substituir se já existir. Nesse caso, como o arquivo "arquivos_formatoEscolhido_localizados.txt" ainda não existe, ele é criado. Obs: Para mais opções, ver documentação. Obs 2: O ponto entre as informações, serve para concatenar (juntar) um valor com o outro, pois temos tipos de valores diferentes, simples textos(Strings), junto com variáveis.

        Loop % arquivos.Length() ; Faz um loop com o comprimento da Array "arquivos" (Linha 19), ou seja, o número de vezes que o loop vai ser executado vai ser equivalente a quantidade de arquivos encontrados que existir dentro da Array "arquivos" (Linha 19). | (arquivos.Length()) - Retorna o comprimento da Array "arquivos" (Linha 19), isto é, a quantidade de valores contidos na Array "arquivos" (Linha 19).
        {
            arquivo.Write(arquivos[A_Index] . "`r`n") ; Para cada valor da Array "arquivos" (Linha 19), é escrito em nosso arquivo de texto criado (Linha 42), o caminho (Linha 28) de cada arquivo localizado no formato informado (Linha 12). | (arquivo.Write()) - Função que deve conter como parâmetro tudo que desejamos escrever no arquivo de texto criado (Linha 42). | (arquivos[]) - Array (Linha 19). | (A_Index) - Variável de sistema que contém o número da volta atual do loop (Linha 44). | (.) - Obs: Serve para concatenar (juntar) um valor com o outro, pois temos tipos de valores diferentes, textos e variáveis. | ("`r`n") - `r: Inicio de linha. `n: Quebra de linha. Os dois juntos servem para criar um nova linha no nosso arquivo de texto. Ou seja, para cada valor escrito (Linha 46), é criado uma nova linha, para o próximo valor ser inserido na linha de baixo, e assim sucessivamente.
        }
    }
    else ; Caso contrário, se a última condição for falsa (Linha 40), a linha 51 é executada.
    {
        ExitApp ; Faz o script parar de executar (Fim da automação).
    }

    Run, %A_ScriptDir%\arquivos_%formato%localizados.txt ; Abre o arquivo de texto criado (Linha 40), que contém o caminho de todos os arquivos localizados no formato informado (Linha 12). | (%A_ScriptDir%) - Variável de sistema que contém o caminho padrão de onde você está executando o script, então por exemplo, se você criou ou baixou essa automação na sua área de trabalho (Desktop), o arquivo "arquivos_formatoEscolhido_localizados.txt" (Linha 54), vai ser criado na sua área de trabalho. Dessa forma, você pode optar por ao invés de colocar "%A_ScriptDir%", colocar o caminho da localização do script. Exemplo: "C:\Users\usuario\Desktop", dessa forma ficaria: Run, C:\Users\usuario\Desktop\arquivos%formato%_localizados.txt.
    ExitApp ; Faz o script parar de executar (Fim da automação).

}

else ; Caso contrário, se a última condição for falsa (Linha 33), a linha 61-62 é executada.
{
    MsgBox, 48, Aviso, Não foram encontrados arquivos para o formato buscado! ; Exibe uma mensagem. | (48) - Exibe uma mensagem de alerta, com o ícone de exclamação. | (Aviso) - Título da mensagem. | (Não foram encontrados arquivos para o formato buscado!) - Mensagem que será exibida para o usuário.
    ExitApp ; Faz o script parar de executar (Fim da automação).
}

Esc:: ; Cria uma HotKey de emergência para a tecla ESC, para o caso de o usuário desejar parar o script, por exemplo, caso a busca esteja demorando muito, ou sem querer foi informado um formato inválido. (Isto é, a qualquer momento em que o o usuário pressionar a tecla ESC, o script para de executar).
ExitApp ; Faz o script parar de executar (Fim da automação).