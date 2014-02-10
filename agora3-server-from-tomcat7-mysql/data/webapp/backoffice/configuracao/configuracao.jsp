<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/codethat/codethatsdk.js'></script>
<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/codethat/codethatgridpro.js'></script>
<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/codethat/codethattype.js'></script>
<script language="javascript1.2">
<!--
function initDocument()
{
}

function choose( codigo )
	{
	url = 'choosecontent.do2?codigo=' + codigo;
	window.open( url, "escolha", "height=500,width=500,resizable=1,scrollbars=1" );
	}

function showbutton( sel, i )
{
	var obj = document.getElementById( "newbutton" + i );
	if ( sel.value == 'C' )
		obj.style.display = "block";
	else
		obj.style.display = "none";
}

var gridDef =
	{
	useExportBar 	 : 0,
	useMultiSort	 : 0,
	useColTitle 	 : 1,
	amountPerPage : 27,
	useRCID : 0,
	markType : 2,
	//datatype 0-array, 1-csv string, 2-xml file, 3 - cvs file, 4 - xml string
	datatype : 0, 
	data : [
	<bean:size id = "sizeCont" name="configEntries"/>
	<logic:iterate id="configEntry" name="configEntries" indexId="index"> 
		<bean:define id="code" name="configEntry" property="codconfiguracao" />
			[
				'<input type="checkbox" name="entryToDelete[${index}]" value="${code}">',
				'<input type="text" name="configuracao(${code}).descricao" value="${configEntry.descricao}" size="30" maxlength="100">',
				'<input type="hidden" name="configuracao(${code}).codigo" value="${code}">${code}',				
				'<select name="configuracao(${code}).tipo" size="1">' +
						'<option value="C" ${configEntry.tipo == "C" ? "selected" : ""}>Conteudo</option>' +
						'<option value="S" ${configEntry.tipo == "S" ? "selected" : ""}>String</option>' +
						'<option value="N" ${configEntry.tipo == "N" ? "selected" : ""}>Número</option>' +
						'<option value="D" ${configEntry.tipo == "D" ? "selected" : ""}>Data</option>	' +								
					'</select>',				
				'<input type="text" name="configuracao(${code}).valor" value="${configEntry.valor}" id="dado${code}" size="20" maxlength="254">',
				<logic:equal name="configEntry" property="tipo" value="C">
					<logic:present name="configuracaoForm" property='configuracao(${code}).titulo'>
						'<span id="link${code}"><a href="../displayconteudo.do2?numero=${condigEntry.valor}" target="_blank"><bean:write name="configuracaoForm" property="configuracao(${code}).titulo"/></a></span>',
					</logic:present>
					<logic:notPresent name="configuracaoForm" property="configuracao(${code}).titulo">
						'<span style="color:red"><bean:message key="kcms.label.invalid.configentry"/></span>',
					</logic:notPresent>
				</logic:equal>
				<logic:notEqual name="configEntry" property="tipo" value="C">
					'&nbsp;',
				</logic:notEqual>
				<logic:equal name="configEntry" property="tipo" value="C">
					'<input type="button" value="..." onclick="choose( \'${code}\' );">'
				</logic:equal>
				<logic:notEqual name="configEntry" property="tipo" value="C">
					'&nbsp;'
				</logic:notEqual>
			],
	</logic:iterate>
	<c:forEach begin="0" end="10" varStatus="status">
       	[
			'&nbsp;',
			'<input type="text" name="configuracao(new${status.index}).descricao" value="" size="30" maxlength="100">',
			'<input type="text" name="configuracao(new${status.index}).codigo" value="" size="10" maxlength="10">',
			'<select name="configuracao(new${status.index}).tipo" value="" onchange="showbutton( this, ${status.index} ); ">' +
					'<option value=""></option>' +
					'<option value="C">Conteúdo</option>' +
					'<option value="S">String</option>' +
					'<option value="N">Número</option>' +
					'<option value="D">Data</option>' +
					'</select>',
			'<input type="text" name="configuracao(new${status.index}).valor" value="" size="20" maxlength="254" id="dadonewvalue${status.index}">',
			'<span id="linknewvalue${status.index}">&nbsp;</span>',
			'<div id="newbutton${status.index}" style="display: none"><input type="button" value="..." onclick="choose( \'newvalue${status.index}\' );"></div>'
		]<c:if test="${!status.last}">,</c:if>
	</c:forEach>
	],
	colDef : [
	{
		title : "&nbsp;",
		titleClass : "",
		type : "HTML",
		width : 35, //auto
		alignment : "center",
		compareFunction : compare,
		isVisible : true,
		useAutoIndex : false,
		useAutoFilter : false,
		isReadOnly : 1
	},
	{
		title : "<bean:message key='kcms.configuracao.descricao' />",
		titleClass : "",
		type : "HTML",
		width : 185, //auto
		alignment : "left",
		compareFunction : compare,
		isVisible : true,
		useAutoIndex : false,
		useAutoFilter : false,
		isReadOnly : 1
	},
	{
		title : "<bean:message key='kcms.configuracao.codigo' />",
		titleClass : "", //default for th
		type : "HTML",
		width : 90, //auto
		alignment : "left",
		compareFunction : compare,
		isVisible : true,
		useAutoIndex : 0,
		useAutoFilter : 0,
		isReadOnly : 1
	},
	{
		title : "<bean:message key='kcms.configuracao.tipo' />",
		titleClass : "", //default for th
		type : "HTML",
		width : 110, //auto
		alignment : "center",
		compareFunction : compare,
		isVisible : true,
		useAutoIndex : 0,
		useAutoFilter : 0,
		isReadOnly : 1
	},
	{
		title : "<bean:message key='kcms.configuracao.valor' />",
		titleClass : "", //default for th
		type : "HTML",
		width : 110, //auto
		alignment : "center",
		compareFunction : compare,
		isVisible : true,
		useAutoIndex : 0,
		useAutoFilter : 0,
		isReadOnly : 1
	},
	{
		title : "&nbsp;",
		titleClass : "", //default for th
		type : "HTML",
		width : 250, //auto
		alignment : "center",
		compareFunction : compare,
		isVisible : true,
		useAutoIndex : 0,
		useAutoFilter : 0,
		isReadOnly : 1
	},
	{
		title : "&nbsp;",
		titleClass : "", //default for th
		type : "HTML",
		width : 50, //auto
		alignment : "center",
		compareFunction : compare,
		isVisible : true,
		useAutoIndex : 0,
		useAutoFilter : 0,
		isReadOnly : 1
	}
 ],
	tableStyle : {
		tableClass : {
			borderwidth : "1", borderstyle : "solid", bordercolor : "#cfcfcf"
		},
		thClass : {
			fontfamily : "Verdana", fontsize : "10px", color : "#000000", borderwidth : "1", borderstyle : "solid", bordercolor : "#cfcfcf", backgroundcolor : "#ececec"
		},
		tdClass : {
			fontfamily : "Verdana", fontsize : "10px", color : "#000000"
		},
		bgcolor : "#ffffff",
		x : 0,
		y : 0,
		height : 650,
		width : 850,
		overflow : 'auto'
	},
	rowStyle : {
		defaultClass : {
			fontfamily : "Verdana", fontsize : "10px", backgroundcolor : "#cccccc", borderwidth : "1", borderstyle : "outset", bordercolor : "#cccccc"
		},
		markClass : {
			backgroundcolor : "#ccccff", fontsize : "10px", borderwidth : "1", borderstyle : "outset", bordercolor : "#cccccc"
		},
		resizeClass : {
			cursor : "row-resize", borderwidth : "0"
		},
		dragClass : {
			cursor : "move", borderwidth : "0"
		},
		width : 20,
		height : 20
	},
	colStyle : {
		defaultClass : {
			fontfamily : "Verdana", fontsize : "10px", backgroundcolor : "#cccccc", borderwidth : "1", borderstyle : "outset", bordercolor : "#cccccc"
		},
		markClass : {
			backgroundcolor : "#ccccff", fontsize : "10px", borderwidth : "1", borderstyle : "outset", bordercolor : "#cccccc"
		},
		resizeClass : {
			cursor : "col-resize", borderwidth : "0"
		},
		dragClass : {
			cursor : "move", borderwidth : "0"
		},
		width : 100,
		height : 20
	},
	cellStyle : {
		defaultClass : {
			borderwidth : "1", borderstyle : "solid", bordercolor : "#cfcfcf", fontfamily : "Arial", fontsize : "10px", backgroundcolor : "#ffffff", color : "#000000"
		},
		markClass : {
			borderwidth : "1", borderstyle : "outset", bordercolor : "#cccccc", fontfamily : "Arial", fontsize : "10px", backgroundcolor : "#cfcfcf", color : "#000000"
		},
		currClass : {
			borderwidth : "2", borderstyle : "solid", bordercolor : "#000000", fontfamily : "Arial", fontsize : "10px", backgroundcolor : "#ffffff", color : "#000000"
		}
	},
	toolBar : {
		height : 29,
		bgcolor : "#ffffff",
		defaultClass : {
			borderwidth : 1, bordercolor : "#bbbbbb", borderstyle : "solid"
		},
		buttons : [
		{ }, //separator
		{
			name : "copy",
			img_on : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/copy.gif", width : "16", height : "16"
			},
			img_off : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/copy_off.gif", width : "16", height : "16"
			},
			text : "Copiar"
		},
		{ },
		{
			name : "sortasc",
			img_on : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/sortasc.gif", width : "16", height : "16"
			},
			img_off : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/sortasc_off.gif", width : "16", height : "16"
			},
			text : "Ordenar os dados da coluna corrente em ordem crescente"
		},
		{
			name : "sortdesc",
			img_on : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/sortdesc.gif", width : "16", height : "16"
			},
			img_off : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/sortdesc_off.gif", width : "16", height : "16"
			},
			text : "Ordenar os dados da coluna corrente em ordem decrescente"
		},
		{
			name : "multisortasc",
			img_on : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/multisortasc.gif", width : "16", height : "16"
			},
			img_off : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/multisortasc_off.gif", width : "16", height : "16"
			},
			text : "Manter a ordem corrente e reordenar os dados da coluna corrente em ordem Crescente"
		},
		{
			name : "multisortdesc",
			img_on : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/multisortdesc.gif", width : "16", height : "16"
			},
			img_off : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/multisortdesc_off.gif", width : "16", height : "16"
			},
			text : "Manter a ordem corrente e reordenar os dados da coluna corrente em ordem descendente"
		},
		{
			name : "resetsort",
			img_on : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/resetsort.gif", width : "16", height : "16"
			},
			img_off : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/resetsort_off.gif", width : "16", height : "16"
			},
			text : "Reiniciar ordenação"
		},
		{ },
		{
			name : "setsearch",
			img_on : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/setsearch.gif", width : "16", height : "16"
			},
			text : "Pesquisa na Grelha"
		},
		{
			name : "resetsearch",
			img_on : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/resetsearch.gif", width : "16", height : "16"
			},
			text : "Mostrar todos os registos."
		},
		{
			name : "setamount",
			img_on : {
				src : "${pageContext.request.contextPath}/backoffice/themes/codethat/setamount.gif", width : "16", height : "16"
			},
			text : "Número de Linhas por página"
		} ]
	},
	statusBar : {
		height : 15,
		bgcolor : "#ffffff",
		defaultClass : {
			color : "#000000", fontfamily : "Verdana", fontsize : "11px"
		},
		messageClass : {
			color : "#0000ff", fontfamily : "Verdana", fontsize : "11px"
		},
		fieldText : "Field",
		valueText : "Value"
	},
	pageTurnBar : {
		defaultClass : {
			backgroundcolor : "#ffffff", fontsize : "11px", fontfamily : "Verdana,Arial"
		},
		activeClass : {
			backgroundcolor : "#D4D0C8", fontsize : "11px", fontfamily : "Verdana,Arial"
		},
		img_on : {
			src : "${pageContext.request.contextPath}/backoffice/themes/codethat/t_on.gif"
		},
		img_off : {
			src : "${pageContext.request.contextPath}/backoffice/themes/codethat/t_off.gif"
		},
		text : "Page", width : 65, height : 14
	}

};
//hide selected rows
function hideMarkRows(g)
	{
	for (var i = 0; i < g.rows.length; i++)
		{
		g.rows[i].isVisible = ((!g.rows[i].isMark) ? 1 : 0);
		};
	g.vr.length = 0;
	g.paint();
};
//change css parameters (currClass, defaultClass, markClass) of cell and set cell handler
//change css parameters (defaultClass) of cell.row and set row handler
//change css parameters (defaultClass) of cell.col and set col handler
function changeCss(cell) {
	if (Undef(cell)) {
		alert("Choose cell"); return;
	}
	cell.currClass = 'curr';
	cell.defaultClass = 'def';
	cell.markClass = 'mark';
	cell.handler = cellHandler;
	cell.row.defaultClass = 'def';
	cell.row.handler = rowHandler;
	cell.col.defaultClass = 'def';
	cell.col.handler = colHandler;
	cell.paint();
};
//-------------------------------------------
//e._e - Object window.Event, e._e.type = ["click", "dblclick", "mouseup", "mousedown"]
//e._o - source Object that call handler (CGCol, CGRow or CGCell)
//-------------------------------------------
function cellHandler(e) {
	var g = e._o.row.grid;
	g.msg = e._o + " Event " + e._e.type + "!";
	g.paintBar("sb");
};

function rowHandler(e) {
	var g = e._o.grid;
	g.msg = "Row " + (e._o._id + 1) + " Event " + e._e.type + "!";
	g.paintBar("sb");
};

function colHandler(e) {
	var g = e._o.grid;
	g.msg = "Column " + e._o.title + " Event " + e._e.type + "!";
	g.paintBar("sb");
};

function setBarVisibility(g, bar) {
	var o = CT_fe(g.getID(bar));
	if (Def(o)) {
		if (o.style.visibility == "hidden") {
			o.style.visibility = "visible"
			o.style.display = "block";
		}
		else {
			o.style.visibility = "hidden";
			o.style.display = "none";
		};
	};
};
//-->
</script>

<h1>${empresa.titulo}</h1>
<h2>Entradas de configuração:</h2>
<html:form action="/gestaoConfiguracao">
	<html:hidden property="method" value="update"/>
<script language="javascript1.2">
<!--
var g = new CCodeThatGrid("g", 1, 4);
g.init(gridDef);
g.doAction();
setBarVisibility(g, 'sb');

//-->
</script>
	<html:submit value="Submeter"/>
</html:form>
