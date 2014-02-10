// I18N constants

// LANG: "en", ENCODING: UTF-8 | ISO-8859-1
// Author: Mihai Bazon, http://dynarch.com/mishoo

// FOR TRANSLATORS:
//
//   1. PLEASE PUT YOUR CONTACT INFO IN THE ABOVE LINE
//      (at least a valid email address)
//
//   2. PLEASE TRY TO USE UTF-8 FOR ENCODING;
//      (if this is not possible, please include a comment
//       that states what encoding is necessary.)

HTMLArea.I18N = {

	// the following should be the filename without .js extension
	// it will be used for automatically load plugin language.
	lang: "pt",

	tooltips: {
		bold:           "Negrito",
		italic:         "Itálico",
		underline:      "Sublinhado",
		strikethrough:  "Strikethrough",
		subscript:      "Subscript",
		superscript:    "Superscript",
		justifyleft:    "Alinhamento à esquerda",
		justifycenter:  "Alinhamento ao centro",
		justifyright:   "Alinhamento à direita",
		justifyfull:    "Alinhamento justificado",
		orderedlist:    "Lista Ordenada",
		unorderedlist:  "Bulleted List",
		outdent:        "Aumentar Endentação",
		indent:         "Diminuir Endentação",
		forecolor:      "Cor da Letra",
		hilitecolor:    "Cor de Fundo",
		horizontalrule: "Linha Horizontal",
		createlink:     "Inserir Link Web",
		insertimage:    "Inserir/Modificar Imagem",
		inserttable:    "Inserir Tabela",
		htmlmode:       "Ver Código HTML",
		popupeditor:    "Aumentar Editor",
		about:          "Acerca deste editor",
		showhelp:       "Ajuda a usar este editor",
		textindicator:  "Estilo actual",
		undo:           "Cancela a sua última acção",
		redo:           "Repete a sua última acção",
		cut:            "Corta selecção",
		copy:           "Copia selecção",
		paste:          "Cola a partir da área de transferência",
		lefttoright:    "Direcção esquerda para direita",
		righttoleft:    "Direcção direita para esquerda"
	},

	buttons: {
		"ok":           "OK",
		"cancel":       "Cancelar"
	},

	msg: {
		"Path":         "Caminho",
		"TEXT_MODE":    "Você está em MODO CÓDIGO-FONTE.  Use o botão [<>] para voltar ao MODO TEXTO.",

		"IE-sucks-full-screen" :
		// translate here
		"The full screen mode is known to cause problems with Internet Explorer, " +
		"due to browser bugs that we weren't able to workaround.  You might experience garbage " +
		"display, lack of editor functions and/or random browser crashes.  If your system is Windows 9x " +
		"it's very likely that you'll get a 'General Protection Fault' and need to reboot.\n\n" +
		"You have been warned.  Please press OK if you still want to try the full screen editor."
	},

	dialogs: {
		"Cancel"                                            : "Cancelar",
		"Insert/Modify Link"                                : "Inserir/Modificar Link",
		"New window (_blank)"                               : "Nova Janela (_blank)",
		"None (use implicit)"                               : "Nenhuma (usar implicíta)",
		"OK"                                                : "OK",
		"Other"                                             : "Outra",
		"Same frame (_self)"                                : "Mesma frame (_self)",
		"Target:"                                           : "Alvo:",
		"Title (tooltip):"                                  : "Título (tooltip):",
		"Top frame (_top)"                                  : "Frame de Topo (_top)",
		"URL:"                                              : "URL:",
		"You must enter the URL where this link points to"  : "Deve escrever o URL para onde este link aponta"
	}
};
