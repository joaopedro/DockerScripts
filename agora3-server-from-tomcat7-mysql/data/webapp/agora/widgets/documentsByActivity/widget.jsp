<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src='${pageContext.request.contextPath}/newlayout/widgets/processes/processes.js' type="text/javascript"></script>

<script>
    loadPage = function(nid, page){
        $('#documentsByActivityTable > tbody tr').remove();
        $.getJSON( "${pageContext.request.contextPath}/agora/getDocumentsByActivity.do?nid=" + nid + "&page="+page).done(function(json){
            var numberOfPages = json.numberOfPages;
            var pageNumbersHtml = '<span class="NumPages">&lt;&lt; &nbsp;&lt; &nbsp;';
            for (var i=1;i<=numberOfPages;i++){
                if(i== page+1){
                    pageNumbersHtml += i +'&nbsp;';
                }else{
                    pageNumbersHtml += '<a href="#" onclick="loadPage('+ nid + ',' + (i-1) +');"><b>'+i+'</b></a>&nbsp;';
                }

            }
            pageNumbersHtml += '&nbsp;&gt; &nbsp;&gt;&gt;</span>'
            $('#TableSort').html(pageNumbersHtml);

            if(json.length==0){
                            var tr = '<tr class="no_read"><td colspan="6" style="text-align:center">Não existem Documentos</td></tr>';
                            $('#documentsByActivityTable > tbody:last').append(tr);
            }else{
                $.each(json.list, function(i, item){
                    var documentDate = new Date(item.creation);
                    var documentDate_str=('0'+documentDate.getDate()).substr(-2,2)+
                            '-'+('0'+documentDate.getMonth()).substr(-2,2)+
                            '-'+('0'+documentDate.getFullYear()).substr(-2,2)+
                            ' '+('0'+documentDate.getHours()).substr(-2,2)+
                            ':'+('0'+documentDate.getMinutes()).substr(-2,2);

                    var tr = '<tr id="'+item.id+'" class="no_read">'+
                            '<td>'+item.number+'</td>'+
                            '<td>'+item.name+'</td>'+
                            '<td>'+item.process+'</td>'+
                            '<td>'+documentDate_str+'</td>'+
                            '<td>'+item.creatorName+'</td></tr>';
                    $('#documentsByActivityTable > tbody:last').append(tr);
                });
            }
        });
    }

    loadPage(${nid}, 0);

</script>

<div id="tableDiv">
    <div id="TableSort" class="TabSort"></div>
    <div id="Table">
        <table id="documentsByActivityTable">
            <thead>
            <tr id="headRow">
                <th>Nº Documento</th>
                <th class="sortable">Título</th>
                <th class="sortable">Processo</th>
                <th class="sortable">Criado em</th>
                <th class="sortable">Criado Por</th>
            </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>
    </div>
</div>
