<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	$(document).ready(function() {
		var widgetsContainer = document.getElementById('main-body');
		widgetsContainer.style.height = "80%";

		var menuTab = document.getElementById('MenuTab');
		var exists = $("#MenuTab li:contains('As Minhas Pesquisas')").length > 0;
		if(!exists){
			var processesTabsScroller = document.getElementById('ProcessesTabsScroller');

			var li = document.createElement("li");

			var a = document.createElement('a');
			a.innerHTML = 'As Minhas Pesquisas';
	        a.href =  '#';
			a.onclick = function(){
				ajaxRequest('/newlayout/mySearches.do');
			}

			li.appendChild(a);

			menuTab.insertBefore(li,processesTabsScroller);
		}

		toggleTab('As Minhas Pesquisas');

		var fixHelper = function(e, ui) {
			ui.children().each(function() {
				$(this).width($(this).width());
			});
			return ui;
		};
	});

    duplicateLine = function (child) {
        var clone = child.parentNode.parentNode.parentNode.parentNode.cloneNode(true); // true means clone all childNodes and all event handlers
        clone.id = "some_id";
        child.parentNode.parentNode.parentNode.parentNode.parentNode.appendChild(clone);

    }

    addForm = function (element) {
        var cloneForm = $("#dynamicFormParamTemplate")[0].cloneNode(true); // true means clone all childNodes and all event handlers
        cloneForm.style.display = "inline";
        element.parentNode.parentNode.parentNode.appendChild(cloneForm);

    }

    $.fn.serializeObject = function () {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };

    $(function () {
        $('#searchesForm').submit(function () {
            searchesJson.searches.push(JSON.stringify($('form').serializeObject()));
     		createCookie('searches', JSON.stringify(searchesJson), 6);
            loadSearches(searchesJson);
            return false;
        });
    });

    updateFields = function(element){
        $.getJSON( "${pageContext.request.contextPath}/newlayout/mySearchesFormFieds.do?formId="+element.value).done(function(json){
            $("#campoForm1Linha1",element.parentNode.parentNode).empty();
            $.each(json, function(i, item){
                $("#campoForm1Linha1",element.parentNode.parentNode)
                        .append($("<option></option>")
                                .attr("value",item.id)
                                .text(item.name));
            });
        });
    }

    loadSearches = function(json){
        $('#existingSearches').empty();
        $.each(json.searches, function(i, item){
            var itemJson = JSON.parse(item);
            $('#existingSearches').append("<div class='FormRow'><label >"+itemJson.nome+"</label></div>");
         });
    }

    resetForm = function(){
        $(':input').not(':button, :submit, :reset, :hidden').val('');
    }

    var searchesCookie = readCookie('searches');
    var searchesJson = {searches:[]};

    if(searchesCookie != null){
        searchesJson = JSON.parse(searchesCookie);
    }
    loadSearches(searchesJson);
</script>

<h1>As Minhas Pesquisas</h1>
<div id="existingSearches" ></div>

<h1>Nova Pesquisa</h1>
<form class="Geral" id="searchesForm" >
    <div>
        <div class="FormRow">
            <label title="Nome">* Nome:</label>
            <input type="text" name="nome" title="Nome" value="">
        </div>
        <div class="FormRow">
            <div class="FormCellLeft" style="width:22%;">
                <label title="layout">* Layout:</label>
                <select name="searchLayout" id="searchLayout" >
                    <option value="half" selected="true">Half</option>
                    <option value="full" >Full</option>
                </select>
            </div>
            <div class="FormCellRight" style="width:77%;">
                <div class="FormCellLeft" >
                    <label title="resultType">* Resultado:</label>
                    <select name="resultType" id="resultType" >
                        <option value="processos" selected="true">Processos</option>
                        <option value="documentos" >Documentos</option>
                    </select>
                </div>
                <div class="FormCellRight">
                    <label title="detailType">* Detalhe:</label>
                    <select name="detailType" id="detailType" >
                        <option value="Actividade" selected="true">Actividade</option>
                        <option value="Consulta" >Consulta</option>
                    </select>
                </div>
            </div>
        </div>
        <br/>
        <jsp:include page="costumSearchParams.jsp"/>
    </div>
	<div class="button">
		<input name="" type="button" value="Gravar" class="BT_primary" onclick="$('#searchesForm').submit();">
		<input name="" type="button" value="Cancelar" onclick="resetForm();">
	</div>
</form>
