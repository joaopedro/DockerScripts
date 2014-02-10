<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
loadPage = function(page){
    $('#table > tbody tr').remove();
    $('#myDocumentsTableDiv').parent().parent().parent().mask(fmtResources.loadingMsg);
    $.getJSON( "${pageContext.request.contextPath}/agora/getDocuments.do?page="+page).done(function(json){
        var numberOfPages = json.numberOfPages;
        var pageNumbersHtml = '<span class="NumPages">&lt;&lt; &nbsp;&lt; &nbsp;';
        for (var i=1;i<=numberOfPages;i++){
            if(i== page+1){
                pageNumbersHtml += i +'&nbsp;';
            }else{
                pageNumbersHtml += '<a href="#" onclick="loadPage('+ (i-1) +');"><b>'+i+'</b></a>&nbsp;';
            }

        }
        pageNumbersHtml += '&nbsp;&gt; &nbsp;&gt;&gt;</span>'
        $('#TableSort').html(pageNumbersHtml);


        $.each(json.list, function(i, item){
            var documentDate = new Date(item.creation);
            var documentDate_str=('0'+documentDate.getDate()).substr(-2,2)+
            '-'+('0'+documentDate.getMonth()).substr(-2,2)+
            '-'+('0'+documentDate.getFullYear()).substr(-2,2)+
            ' '+('0'+documentDate.getHours()).substr(-2,2)+
            ':'+('0'+documentDate.getMinutes()).substr(-2,2);

            var tr = '<tr id="'+item.id+'" class="no_read">'+
                                     '<td><a href="#" onclick="openNotification('+item.id+',&quot;'+item.number+'&quot;,{documentId:'+item.id+'})">'+item.number+'</a></td>'+
                                     '<td>'+item.name+'</td>'+
                                     '<td>'+item.process+'</td>'+
                                     '<td>'+documentDate_str+'</td>'+
                                     '<td>'+item.creatorName+'</td></tr>';
           $('#table > tbody:last').append(tr);
        });
        
        $('#myDocumentsTableDiv').parent().parent().parent().unmask();
    });
}

loadPage(0);

</script>

<div id="myDocumentsTableDiv">
	<div id="TableSort" class="TabSort"></div>
	<div id="Table">
        <table id="table">
            <thead>
                <tr id="headRow">
                    <th>N� Documento</th>
                    <th class="sortable">Titulo</th>
                    <th class="sortable">Processo</th>
                    <th class="sortable">Criado em</th>
                    <th class="sortable">Criado Por</th>
                </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>
    </div>
</div>