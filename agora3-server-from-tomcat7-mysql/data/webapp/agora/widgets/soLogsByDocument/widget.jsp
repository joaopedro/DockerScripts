<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src='${pageContext.request.contextPath}/newlayout/widgets/processes/processes.js' type="text/javascript"></script>

<script>
    loadPage = function(documentId){
        $('#soLogByDocumentTable > tbody tr').remove();
        $.getJSON( "${pageContext.request.contextPath}/agora/getLogEntriesByDoc.do?documentId="+documentId).done(function(json){

            if(json.length==0){
                var tr = '<tr class="no_read"><td colspan="6" style="text-align:center">Não existem eventos</td></tr>';
                $('#soLogByDocumentTable > tbody:last').append(tr);
            }else{
                $.each(json, function(i, item){

                    var begindate = new Date(item.begindate);
                    var begindate_str=('0'+begindate.getDate()).substr(-2,2)+
                            '-'+('0'+begindate.getMonth()).substr(-2,2)+
                            '-'+('0'+begindate.getFullYear()).substr(-2,2)+
                            ' '+('0'+begindate.getHours()).substr(-2,2)+
                            ':'+('0'+begindate.getMinutes()).substr(-2,2);

                    var enddate = new Date(item.enddate);
                    var enddate_str="";
                    if(item.enddate!=null){
                        enddate_str=('0'+enddate.getDate()).substr(-2,2)+
                                '-'+('0'+enddate.getMonth()).substr(-2,2)+
                                '-'+('0'+enddate.getFullYear()).substr(-2,2)+
                                ' '+('0'+enddate.getHours()).substr(-2,2)+
                                ':'+('0'+enddate.getMinutes()).substr(-2,2);
                    }


                    var tr = '<tr id="'+item.id+'" class="no_read">'+
                        //                        '<td><a href="#" onclick="openNotification('+item.id+',&quot;'+item.number+'&quot;,{documentId:'+item.id+'})">'+item.number+'</a></td>'+
                            '<td>'+item.etapa.titulo+'</td>'+
                            '<td>'+item.tipomovimento.descricao+'</td>'+
                            '<td>'+begindate_str+'</td>'+
                            '<td>'+enddate_str+'</td>'+
                            '<td>'+item.responder+'</td>'+
                            '<td>'+item.colaborador.name+'</td>'+
                            '<td>'+item.assigneduser+'</td>'+
                            '<td>'+item.comentario+'</td></tr>';
                    $('#soLogByDocumentTable > tbody:last').append(tr);
                });
            }
        });
    }

    loadPage(${documentId});

</script>

<div id="tableDiv">
    <div id="TableSort" class="TabSort"></div>
    <div id="Table">
        <table id="soLogByDocumentTable">
            <thead>
            <tr id="headRow">
                <th>Etapa</th>
                <th class="sortable">Tipo de Acção</th>
                <th class="sortable">Data Inicio</th>
                <th class="sortable">Data Fim</th>
                <th class="sortable">Respondido por</th>
                <th class="sortable">Colaborador</th>
                <th class="sortable">Assignado a</th>
                <th class="sortable">Resposta</th>
            </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>
    </div>
</div>