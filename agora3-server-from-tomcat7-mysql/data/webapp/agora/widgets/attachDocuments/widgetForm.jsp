<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:message key="agora.attachdocuments.title" var="title" />
<fmt:message key="agora.attachdocuments.file.description" var="fileDesc" />
<fmt:message key="agora.attachdocuments.files.attached" var="filesAttached" />
<fmt:message key="agora.attachdocuments.addfile" var="addFile" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />

<script src="${pageContext.request.contextPath}/newlayout/js/jquery-form/jquery.form.js"></script>
<script type="text/javascript">

    function submitForm(){
        $('#attachDocumentsForm').ajaxForm({
            dataType: 'text',
            success:function(data) {
                $('#attachDocumentsDiv #resultDiv').html(data);
            }
        }).submit();
    }

</script>

<script type="text/javascript">

    // global variable for input file types
    // used if new input elements of file type are added
    var idx = 1;

    function addElement(){

        // get parent element
        var parentDiv = document.getElementById('fileDiv');

        // create new input for file description and add to div
        var divLeft = document.createElement("div");
        divLeft.setAttribute('class','FormCellLeft');
        divLeft.style.width = '25%';
        divLeft.appendChild(createDescInput('file' + idx + 'Desc','file' + idx));

        // create new input for file and add to div
        var divRight = document.createElement("div");
        divRight.setAttribute('class','FormCellRight');
        divRight.style.width = '75%';
        divRight.appendChild(createFileInput('file' + idx));

        //  add new div's to parent div "fileDiv"
        parentDiv.appendChild(divLeft);
        parentDiv.appendChild(divRight);

        // increment idx of total input files type rendered
        idx = idx + 1;
    }


    function createDescInput(id, fileId){
        var input = document.createElement("input");
        input.type = 'text';
        input.id = id;
        input.name = id;
        input.title = '${fileDesc}';
        var handler = 'enableFormFile(\'' + id + '\',\'' + fileId + '\')';
        input.setAttribute('onkeyup', handler);

        return input;
    }

    function createFileInput(id){
        var input = document.createElement("input");
        input.type = 'file';
        input.id = id;
        input.name = id;
        input.disabled = true;
        return input;
    }

</script>

<script type="text/javascript">

    function enableFormFile(element, target) {
        var inputElement = document.getElementById(element);
        var disable = true;
        if(inputElement.value != ''){
            disable = false;
        }

        document.getElementById(target).disabled = disable;
    }

</script>

<form:form id="attachDocumentsForm" class="geral" action="${pageContext.request.contextPath}/agora/process.do" method="post" enctype="multipart/form-data">

    <input type="hidden" id="taskId" name="taskId" value="${taskId}">

    <fieldset style="width:100%" id="tabsFieldSet" class="formGeralFieldset">
        <legend class="formGeralLegend" style="font-size: 0.625em; background: #b7c922;">${title}</legend>

        <div class="FormRow" id="fileDiv">
            <div class="FormCellLeft" style="width: 25%;">
                <input type="text" id="file0Desc" name="file0Desc" title="${fileDesc}" onkeyup="enableFormFile('file0Desc','file0');" />
            </div>
            <div class="FormCellRight" style="width: 75%;">
                <input type="file" id="file0" name="file0" disabled />
            </div>
        </div>

    </fieldset>

    <div class="FormRow">
        <div class="FormCellLeft">
            <a href="#" style="color: #00a4e8;" onclick="addElement()">${addFile}</a>
        </div>
    </div>

    <br/>
    <div class="button" style="padding: 0px;">
        <input type="button" class="BT_primary" style="font-size: 10px;"  value="${submit}" title="${submitTitle}" onclick="submitForm()" />
        <input type="button" style="font-size: 10px;" value="${cancelar}" title="${cancelarTitle}" onclick="javascript: location.reload()" />
    <div>

</form:form>

<br/>
<div id="resultDiv" style="font-size: 0.625em;"></div>
