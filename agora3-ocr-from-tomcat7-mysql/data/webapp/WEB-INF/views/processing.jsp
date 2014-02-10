<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <script type="text/javascript">
                function SHProcessing (processingId) {
                    var restUrl = "processing/showDocumentProcessing?" + "processingId=" + processingId;
                    $.ajax({
                        type: "GET",
                        url: restUrl,
                        beforeSend: function() {
                            $('#div_document_processing').html('<img src="resources/images/loading.gif" />');
                        },
                        success: function(data){
                            $('#div_document_processing').html(data);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + " : " + errorThrown);
                        }
                    });
                }

                function ChangeProcessingType (select, processingId) {
                    var value = select.options[select.selectedIndex].value;
                    var restUrl = "processing/changeProcessingType?" +
                            "processingId=" + processingId +
                            "&processingTypeId=" + value;
                    $.ajax({
                        type: "GET",
                        url: restUrl,
                        beforeSend: function() {
                            $('#td_processingTypeSelect_' + processingId).html('<img src="resources/images/loading.gif" />');
                        },
                        success: function(data){
                            $('#td_processingTypeSelect_' + processingId).html(data);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + " : " + errorThrown);
                        }
                    });
                }

                function SendToAgora (processingId) {
                    var restUrl = "processing/sendtoagora?" +
                            "processingId=" + processingId;
                    $.ajax({
                        type: "GET",
                        url: restUrl,
                        beforeSend: function() {
                            $('#col3_' + processingId).html('<img src="resources/images/loading.gif" />');
                        },
                        success: function(data){
                            var rs = '<a href="javascript:SendToAgora(' + processingId + ');"><img src="<c:url value="/resources/images/icons/Ico_enviar.png" />" />   <fmt:message key="ocr.sendProcessing.button.sendToAgora"/></a>';
                            if (data!="")
                                rs = data;
                            $('#col3_' + processingId).html(rs);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + " : " + errorThrown);
                        }
                    });
                }

                function SHDetailPageDocumentProcessing (documentProcessingId, documentProcessingNamePDF) {
                    var restUrl = "processing/showDetailPageDocumentProcessing?" + "documentProcessingId=" + documentProcessingId;
                    $.ajax({
                        type: "GET",
                        url: restUrl,
                        beforeSend: function() {
                            $('#div_detail_document_processing').html('<img src="resources/images/loading.gif" />');
                            $('#div_pdf_viewer').html('<iframe id="viewer" src = "/resources/Viewer_js/index.html#/docs/'+ documentProcessingNamePDF + '" width="100%" height="100%" allowfullscreen webkitallowfullscreen></iframe>');
                        },
                        success: function(data){
                            $('#div_detail_document_processing').html(data);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + " : " + errorThrown);
                        }
                    });
                }

                function executeOcr (select, documentProcessingId) {
	                var value = select.options[select.selectedIndex].value;
	                var restUrl = "processing/executeOcr?" +
	                "documentProcessingId=" + documentProcessingId +
	                "&documentTypeId=" + value;
	                $.ajax({
	                    type: "GET",
	                    url: restUrl,
	                    beforeSend: function() {
	                        $('#td_dp_' + documentProcessingId).html('<img src="resources/images/loading.gif" />');
	                    },
	                    success: function(data){
	                        $('#td_dp_' + documentProcessingId).html(data);
	                    },
	                    error: function(jqXHR, textStatus, errorThrown) {
	                        alert(XMLHttpRequest.status + " : " + errorThrown);
	                    }
	                });
	            }

                function ChangeDocumentProcessingChecked (object, documentProcessingId) {
                    var agoraselected = 0;
                    if (object.checked)
                        agoraselected = 1;
                    var restUrl = "processing/changeDocumentProcessingChecked?" +
                            "documentProcessingId=" + documentProcessingId +
                            "&agoraselected=" + agoraselected;
                    $.ajax({
                        type: "GET",
                        url: restUrl,
                        beforeSend: function() {
                            $('#' + object.id).html('<img src="resources/images/loading.gif" />');
                        },
                        success: function(data){
                            $('#' + object.id).html(data);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + " : " + errorThrown);
                        }
                    });
                }

                function EditValue (detailPageDocumentProcessingId) {
                    var actId = "act_" + detailPageDocumentProcessingId;
                    var actObj = document.getElementById(actId);
                    actObj.innerHTML = '<a href="javascript:SaveEditValue(\'' + detailPageDocumentProcessingId + '\');"><fmt:message key="ocr.detailPageDocumentProcessing.button.save"/></a><a href="javascript:CancelEditValue(\'' + detailPageDocumentProcessingId + '\');"><fmt:message key="ocr.detailPageDocumentProcessing.button.cancel"/></a>';
                    var inpId = "value_" + detailPageDocumentProcessingId;
                    var inpObj = document.getElementById(inpId);
                    inpObj.disabled = false;
                    inpObj.focus();
                }

                function CancelEditValue (detailPageDocumentProcessingId, value) {
                    var actId = "act_" + detailPageDocumentProcessingId;
                    var actObj = document.getElementById(actId);
                    actObj.innerHTML = '<a href="javascript:EditValue(\'' + detailPageDocumentProcessingId + '\');"><fmt:message key="ocr.detailPageDocumentProcessing.button.edit"/></a>';
                    var inpId = "value_" + detailPageDocumentProcessingId;
                    var inpObj = document.getElementById(inpId);
                    if (value == "null" || value == undefined) {
                        var restUrl = "processing/getValueDetailPageDocumentProcessing?" +
                                "detailPageDocumentProcessingId=" + detailPageDocumentProcessingId;
                        $.ajax({
                            type: "GET",
                            url: restUrl,
                            success: function(data){
                                inpObj.value = data;
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                alert(XMLHttpRequest.status + " : " + errorThrown);
                            }
                        });
                        inpObj.value = valueOld;
                    } else
                        inpObj.value = value;
                    inpObj.disabled = true;
                }

                function SaveEditValue (detailPageDocumentProcessingId) {
                    var inpId = "value_" + detailPageDocumentProcessingId;
                    var inpObj = document.getElementById(inpId);
                    var restUrl = "processing/editDetailPageDocumentProcessing?" +
                            "detailPageDocumentProcessingId=" + detailPageDocumentProcessingId +
                            "&edited=" + inpObj.value;

                    $.ajax({
                        type: "GET",
                        url: restUrl,
                        success: function(data){
                            CancelEditValue (detailPageDocumentProcessingId, data);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + " : " + errorThrown);
                        }
                    });
                }

                function ChangeDetailPageDocumentProcessingChecked (object, detailPageDocumentProcessingId) {
                    var agoraselected = 0;
                    if (object.checked)
                        agoraselected = 1;
                    var restUrl = "processing/changeDetailPageDocumentProcessingChecked?" +
                            "detailPageDocumentProcessingId=" + detailPageDocumentProcessingId +
                            "&agoraselected=" + agoraselected;
                    $.ajax({
                        type: "GET",
                        url: restUrl,
                        beforeSend: function() {
                            $('#' + object.id).html('<img src="resources/images/loading.gif" />');
                        },
                        success: function(data){
                            $('#' + object.id).html(data);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status + " : " + errorThrown);
                        }
                    });
                }

            </script>
            <nav>
                <ul id="MenuTab">
                    <li class="here"><a href="processing"><fmt:message key="ocr.documentProcessing.title"/></a></li>
                </ul>
			</nav>
            <section>
                <div id="Table">
                    <div>
                        <div style="width:50%; float:left;  height: 300px;">
                            <table>
                                <thead>
                                    <th>Id do processamento</th>
                                    <th width="15%">Tipo processo ÁGORA</th>
                                    <th width="15%">Processo ÁGORA</th>
                                </thead>
                                <tbody>
                                <c:forEach var="processing" items="${listProcessing}">
                                    <tr>
                                        <td><a href="javascript:SHProcessing(${processing.id});">${processing.id}</a></td>
                                        <td id="td_processingTypeSelect_${processing.id}">${processing.documentType.name}</td>
                                        <td>
                                            <div id="col3_${processing.id}">
                                                <c:if test="${processing.agoraprocessid==null}">
                                                    <a href="javascript:SendToAgora(${processing.id});"><img src="<c:url value="/resources/images/icons/Ico_enviar.png" />" /> Enviar</a>
                                                </c:if>
                                                <c:if test="${processing.agoraprocessid!=null}">
                                                    ${processing.agoraprocessid}
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div style="padding-left:10px; margin-left:50%; height:300px;">
                            <table>
                                <thead>
                                    <th>Nome do documento</th>
                                    <th width="15%">Tipo do documento</th>
                                    <th width="15%">Seleccionado para envio</th>
                                </thead>
                                <tbody id="div_document_processing"></tbody>
                            </table>
                        </div>
                    </div>
                    <div style="clear:both"></div>
                    <div style="padding-top: 10px;">
                        <div style="width:50%; float:left; height:300px;">
                            <table>
                                <thead>
                                    <th width="15%">Pagina do documento</th>
                                    <th width="15%">Chave</th>
                                    <th>Extraccao</th>
                                    <th width="15%"><img src="<c:url value="/resources/images/icons/Ico_admin1.png" />" width="12" height="12"></th>
                                    <th width="15%">Seleccionado para envio</th>
                                </thead>
                                <tbody id="div_detail_document_processing"></tbody>
                            </table>
                        </div>
                        <div id="div_pdf_viewer" style="padding-left:10px; margin-left:50%; min-width:400px; max-width:100%; height:700px; max-height:100%"></div>
                    </div>
                    <div style="clear:both"></div>
                </div>
			</section>
