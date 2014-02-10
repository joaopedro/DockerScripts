// ** I18N

// Calendar EN language
// Author: Mihai Bazon, <mishoo@infoiasi.ro>
// Encoding: any
// Distributed under the same terms as the calendar itself.

// For translators: please use UTF-8 if possible.  We strongly believe that
// Unicode is the answer to a real internationalized world.  Also please
// include your contact information in the header, as can be seen above.

// full day names
Calendar._DN = new Array
("Domingo",
 "Segunda",
 "Ter�a",
 "Quarta",
 "Quinta",
 "Sexta",
 "S�bado",
 "Domingo");

// Please note that the following array of short day names (and the same goes
// for short month names, _SMN) isn't absolutely necessary.  We give it here
// for exemplification on how one can customize the short day names, but if
// they are simply the first N letters of the full name you can simply say:
//
//   Calendar._SDN_len = N; // short day name length
//   Calendar._SMN_len = N; // short month name length
//
// If N = 3 then this is not needed either since we assume a value of 3 if not
// present, to be compatible with translation files that were written before
// this feature.

// short day names
Calendar._SDN = new Array
("Dom",
 "Seg",
 "Ter",
 "Qua",
 "Qui",
 "Sex",
 "S�b",
 "Dom");

// full month names
Calendar._MN = new Array
("Janeiro",
 "Fevereiro",
 "Mar�o",
 "Abril",
 "Maio",
 "Junho",
 "Julho",
 "Agosto",
 "Setembro",
 "Outubro",
 "Novembro",
 "Dezembro");

// short month names
Calendar._SMN = new Array
("Jan",
 "Fev",
 "Mar",
 "Abr",
 "Mai",
 "Jun",
 "Jul",
 "Ago",
 "Set",
 "Out",
 "Nov",
 "Dez");

// tooltips
Calendar._TT = {};
Calendar._TT["INFO"] = "Sobre este calend�rio";

Calendar._TT["ABOUT"] =
"DHTML Selector de datas/tempo\n" +
"(c) dynarch.com 2002-2003\n" + // don't translate this this ;-)
"�ltima vers�o em: http://dynarch.com/mishoo/calendar.epl\n" +
"Distribu�do em GNU LGPL.  Ver http://gnu.org/licenses/lgpl.html para detalhes." +
"\n\n" +
"Selec��o de datas:\n" +
"- Usar os bot�es \xab, \xbb para seleccionar o ano\n" +
"- Usar os bot�es " + String.fromCharCode(0x2039) + ", " + String.fromCharCode(0x203a) + " para seleccionar o m�s \n" +
"- Manter pressionado o bot�o do rato em qualquer um dos bot�es para uma selec��o mais r�pida.";
Calendar._TT["ABOUT_TIME"] = "\n\n" +
"Selec��o do tempo:\n" +
"- Clicar em qualquer parte que constitu� o tempo para aumentar\n" +
"- ou Shift-click para decrescer\n" +
"- ou click e arraste para selec��o mais r�pida.";

Calendar._TT["PREV_YEAR"] = "Ano Anterior (mantenha para menu)";
Calendar._TT["PREV_MONTH"] = "M�s anterior (mantenha para menu)";
Calendar._TT["GO_TODAY"] = "Ir para Hoje";
Calendar._TT["NEXT_MONTH"] = "Pr�ximo m�s (mantenha para menu)";
Calendar._TT["NEXT_YEAR"] = "Pr�ximo ano (mantenha para menu)";
Calendar._TT["SEL_DATE"] = "Seleccionar data";
Calendar._TT["DRAG_TO_MOVE"] = "Arrastar para mover";
Calendar._TT["PART_TODAY"] = " (hoje)";
Calendar._TT["MON_FIRST"] = "Mostrar Segunda primeiro";
Calendar._TT["SUN_FIRST"] = "Mostrar Domingo primeiro";
Calendar._TT["CLOSE"] = "Fechar";
Calendar._TT["TODAY"] = "Hoje";
Calendar._TT["TIME_PART"] = "(Shift-)Click ou arraste para alterar valor";

// date formats
Calendar._TT["DEF_DATE_FORMAT"] = "%Y-%m-%d";
Calendar._TT["TT_DATE_FORMAT"] = "%a, %b %e";

Calendar._TT["WK"] = "sem";
