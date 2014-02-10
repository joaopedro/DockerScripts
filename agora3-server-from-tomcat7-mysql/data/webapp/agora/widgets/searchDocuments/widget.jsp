<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
loadDocumentSearchPage = function(page){

    var params =  '&numeroDocumento='+$('#numeroDocumento').val()+'&numeroProcesso='+$('#numeroProcesso').val();
    $('#documentSearchResultTable > tbody tr').remove();
    $('#documentSearchTableDiv').parent().parent().parent().mask(fmtResources.loadingMsg);
    $.getJSON( "${pageContext.request.contextPath}/agora/searchDocuments.do?page="+page+params).done(function(json){
        var numberOfPages = json.numberOfPages;
        var pageNumbersHtml = '<span class="NumPages">&lt;&lt; &nbsp;&lt; &nbsp;';
        for (var i=1;i<=numberOfPages;i++){
            if(i== page+1){
                pageNumbersHtml += i +'&nbsp;';
            }else{
                pageNumbersHtml += '<a href="#" onclick="loadDocumentSearchPage('+ (i-1) +');"><b>'+i+'</b></a>&nbsp;';
            }

        }
        pageNumbersHtml += '&nbsp;&gt; &nbsp;&gt;&gt;</span>'
        $('#documentSearchResultTableSort').html(pageNumbersHtml);
        if(json.list.length==0){
            var tr = '<tr class="no_read"><td colspan="6" style="text-align:center">Não foram encontrados resultados</td></tr>';
           $('#documentSearchResultTable > tbody:last').append(tr);
           $('#documentSearchResultTableSort').html('');
        }else{
            $.each(json.list, function(i, item){
                var documentDate = new Date(item.creation);
                var documentDate_str=('0'+documentDate.getDate()).substr(-2,2)+
                '-'+('0'+documentDate.getMonth()).substr(-2,2)+
                '-'+('0'+documentDate.getFullYear()).substr(-2,2)+
                ' '+('0'+documentDate.getHours()).substr(-2,2)+
                ':'+('0'+documentDate.getMinutes()).substr(-2,2);

                var tr = '<tr id="'+item.id+'" class="no_read">'+
                                         '<td><a href="#" onclick="openNotification('+item.id+',&quot;'+item.number+'&quot;,{documentId:'+item.id+'})">'+item.number+'</a></td>'+                                         '<td>'+item.name+'</td>'+
                                         '<td>'+item.process+'</td>'+
                                         '<td>'+item.processNumber+'</td>'+
                                         '<td>'+documentDate_str+'</td>'+
                                         '<td>'+item.creatorName+'</td></tr>';
               $('#documentSearchResultTable > tbody:last').append(tr);
            });
        }

        $('#documentSearchTableDiv').parent().parent().parent().unmask();
    });
}
</script>
<form class="Geral">
        <div class="FormRow">
            <div class="FormCellLeft" style="width: 50%;"><label>Nº de Documento:</label><input name="numeroDocumento" id="numeroDocumento" type="text"></div>
            <div class="FormCellLeft" style="width: 50%;"><label>Nº de processo:</label><input name="numeroProcesso" id="numeroProcesso" type="text"></div>
        </div>
        <div style="border-bottom: 1px solid #97958C;padding-bottom:25px;">
            <input name="" type="button" value="Pesquisar" class="BT_primary" onclick="loadDocumentSearchPage(0);return false;" style="float: right">
        </div>
</form>
<div id="documentSearchTableDiv">
	<div id="documentSearchResultTableSort" class="TabSort"></div>
	<div id="Table">
        <table id="documentSearchResultTable">
            <thead>
                <tr id="headRow">
                    <th>Nº Documento</th>
                    <th class="sortable">Titulo</th>
                    <th class="sortable">Processo</th>
                    <th class="sortable">Nº de Processo</th>
                    <th class="sortable">Criado em</th>
                    <th class="sortable">Criado Por</th>
                </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>
    </div>
</div>