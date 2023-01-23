# AutoHotKey
> O AutoHotkey é uma linguagem de script gratuita e de código aberto para Windows que permite aos usuários criar facilmente scripts pequenos a complexos para todos os tipos de tarefas, como: preenchimento de formulários, cliques automáticos, macros, etc.

## Ambiente de Desenvolvimento
* Sistema Operacional Windows
* [Autohotkey v1.1](https://www.autohotkey.com/download/ahk-install.exe)
* [SciTE4AutoHotkey](https://www.autohotkey.com/scite4ahk/dl/s4ahk-install.exe)
* [Documentação](https://www.autohotkey.com/docs/v1/)

## Cometários
```ahk
;Comentário de Linha é definido por ";"
;Send, Comentário de Linha

;Comentário de Bloco é definido por "/* Texto em Bloco */"
/*
Send, Comentário de Bloco
Sleep, 333
*/
```

## Hoststrings e Hotkeys
Hoststrings são atalhos de palavras que completam ou alteram para um texto definido, também pode ser usado para que seja executado alguma ação no computador.

Exemplo 1
```ahk
:*:bd::Bom dia!
```
>Ao digitar **bd** ele altera o *bd* para **Bom dia!**

Exemplo 2
```ahk
:*:bd::
MsgBox, Bom dia!
```
>Ao digitar **bd** será aberto uma caixa de mensagem escrito **Bom dia!**

Hotkeys são atalhos de teclas que ao pressionar executam alguma ação.

```ahk
```
### Hotkey Modifier Symbols

## Declaração de Váriaveis
```ahk
```
## Váriaveis de Ambiente
```ahk
```
## Trabalhando com Arrays

### Pesquisando em Array

O exemplo seguinte é um modelo de função para localizar valores em um array e retornar seu indice.
```ahk
indexOf(listaDosElementos, elementoDePesquisa) {
	for index, value in listaDosElementos
		if (value = elementoDePesquisa)
			return index
	if !IsObject(listaDosElementos)
		throw Exception("Bad listaDosElementos!", -1, listaDosElementos)
	return 0
}
```

```ahk
```
## Strings
```ahk
```
## Operadores
```ahk
```
## Funções
```ahk
```
## Label
```ahk
```
## Biblioteca
```ahk
```
## Loop
```ahk
```
## Condicional
```ahk
```
## ImageSearch e PixelSearch
```ahk
```
## GUI
```ahk
```
## Menu
```ahk
```
## Control
```ahk
```
## Web Selenium
```ahk
```
## JSON
```ahk
```