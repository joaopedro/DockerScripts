<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="IMG_DIR" value="${CONTEXT_PATH}/newlayout/images" />

<script>
loadCostumSearch = function(page, searchDef, searchId){
    $('#'+searchId+'mySearchesDocumentSearchResultTable > tbody tr').remove();
    $.ajax({
        url: "${pageContext.request.contextPath}/newlayout/getSearchResult.do?page="+page,
        type: 'POST',
        dataType: 'json',
        data: searchDef,
        contentType: 'application/json',
        mimeType: 'application/json',
        success: function(json) {
            var numberOfPages = json.numberOfPages;
            var pageNumbersHtml = '<span class="NumPages">&lt;&lt; &nbsp;&lt; &nbsp;';
            for (var i=1;i<=numberOfPages;i++){
                if(i== page+1){
                    pageNumbersHtml += i +'&nbsp;';
                }else{
                    pageNumbersHtml += '<a href="#" onclick="changePage(this,'+ (i-1) +',"'+searchId+'");"><b>'+i+'</b></a>&nbsp;';
                }

            }
            pageNumbersHtml += '&nbsp;&gt; &nbsp;&gt;&gt;</span>'
            $('#'+searchId+'mySearchesDocumentSearchResultTableSort').html(pageNumbersHtml);
            if(json.list.length==0){
                var tr = '<tr class="no_read"><td colspan="6" style="text-align:center">Não foram encontrados resultados</td></tr>';
                $('#'+searchId+'mySearchesDocumentSearchResultTableSort > tbody:last').append(tr);
                $('#'+searchId+'mySearchesDocumentSearchResultTableSort').html('');
            }else{
                $.each(json.list, function(i, item){
                    var startDate = new Date(item.startDate);
                    var startDate_str=('0'+startDate.getDate()).substr(-2,2)+
                            '-'+('0'+startDate.getMonth()).substr(-2,2)+
                            '-'+('0'+startDate.getFullYear()).substr(-2,2)+
                            ' '+('0'+startDate.getHours()).substr(-2,2)+
                            ':'+('0'+startDate.getMinutes()).substr(-2,2);

                    var tr = '<tr id="${searchId}'+item.numeroConteudo+'" class="no_read">'+
                            '<td>'+item.processNumber+'</a></td>'+
                            '<td>'+item.type+'</td>'+
                            '<td>'+(item.subject==null?'':item.subject)+'</td>'+
                            '<td>'+startDate_str+'</td>'+
                            '<td>'+item.creator+'</td></tr>';
                    $('#'+searchId+'mySearchesDocumentSearchResultTable > tbody:last').append(tr);
                });
            }
        },
        error:function(data,status,er) {
            alert("error: "+data+" status: "+status+" er:"+er);
        }
    });

}

toggleSearchParams = function(searchId){
    $('#'+searchId+'searchParams').toggle("slow",function() {
        var origsrc = $('#'+searchId+'searchParamsToggleElement').attr('src');
        var src = '';
        if (origsrc == '${IMG_DIR}/setaClose.png') src = '${IMG_DIR}/setaOpen.png';
        if (origsrc == '${IMG_DIR}/setaOpen.png') src = '${IMG_DIR}/setaClose.png';
        $('#'+searchId+'searchParamsToggleElement').attr('src', src);
    });
}

updateFormValues = function(data, searchId){
    var jsonData = JSON.parse(data);
    $("#numeroProcesso", '#'+searchId+'searchParams').val(jsonData.numeroProcesso);
    $("#nifEntidade", '#'+searchId+'searchParams').val(jsonData.nifEntidade);
    $("#assignadoa", '#'+searchId+'searchParams').val(jsonData.assignadoa);
    $("#assunto", '#'+searchId+'searchParams').val(jsonData.assunto);
    $('input:radio[name="estado"]','#'+searchId+'searchParams').
            filter('[value="'+jsonData.estado+'"]').attr('checked', true);
}

var searchePreferencesCookie = readCookie('searches');
if(searchePreferencesCookie != null){
    searchePreferencesDefs = JSON.parse(searchePreferencesCookie);
    $.each(searchePreferencesDefs.searches, function(i, item){
        var itemJSON = JSON.parse(item);
        if(itemJSON.nome == '${searchId}'){
            loadCostumSearch(0,item, '${searchId}');
            updateFormValues(item, '${searchId}');
        }


    });
}


duplicateLine = function (child) {
    clone = child.parentNode.parentNode.parentNode.parentNode.cloneNode(true); // true means clone all childNodes and all event handlers
    clone.id = "some_id";
    child.parentNode.parentNode.parentNode.parentNode.parentNode.appendChild(clone);

}

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

updateResultsTable = function (element, searchId){
    var data = JSON.stringify($(element).serializeObject());
    loadCostumSearch(0,data,searchId);
}

changePage = function (element, page, searchId){
    var data = JSON.stringify($(element).serializeObject());
    loadCostumSearch(page,data,searchId);
}
</script>

<h1  onclick="toggleSearchParams('${searchId}');" style="display: inline-block;font-weight: normal;cursor: pointer;" >Propriedades da Pesquisa
    <img id="${searchId}searchParamsToggleElement" src="${IMG_DIR}/setaOpen.png">
</h1>

<form id="${searchId}searchParams" name="${searchId}searchParams" style="display: none">
    <div>
        <jsp:include page="costumSearchParams.jsp"/>
    </div>

    <div class="FormRow">
        <div class="FormCellLeft">
            <input type="button" class="BT_primary" style="font-size: 10px;" name="updateResults" value="Actualizar"
                   onclick="updateResultsTable(this.form, '${searchId}');"/>
        </div>
    </div>

</form>

<div id="${searchId}mySearchesTableDiv">
    <div id="${searchId}mySearchesDocumentSearchResultTableSort" class="TabSort"></div>
    <div id="${searchId}Table" class="Table">
        <table id="${searchId}mySearchesDocumentSearchResultTable">
            <thead>
            <tr id="${searchId}headRow">
                <th>Numero de Processo</th>
                <th class="sortable">Tipo de Processo</th>
                <th class="sortable">Assunto</th>
                <th class="sortable">Criado em</th>
                <th class="sortable">Criado por</th>
            </tr>
            </thead>
            <tbody id="${searchId}tbody"></tbody>
        </table>
    </div>
</div>