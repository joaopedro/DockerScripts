<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <fieldset style="width:100%" id="genericSearchparams" class="formGeralFieldset">
        <legend class="formGeralLegend">Propriedades Genericas</legend>

        <div class="FormRow">
            <div class="FormCellLeft">
                <label title="Nome">Nº de Processo:</label>
                <input type="text" name="numeroProcesso" id="numeroProcesso" title="Numero de Processo" value="">
            </div>
            <div class="FormCellRight">
                <label title="Nome">Nif Entidade:</label>
                <input type="text" name="nifEntidade" id="nifEntidade"  title="NIF da Entidade" value="">
            </div>
        </div>

        <div class="FormRow">
            <div class="FormCellLeft">
                <label title="Nome">Assignado a:</label>
                <input type="text" name="assignadoa" id="assignadoa" title="Assignado a:" value="">
            </div>
            <div class="FormCellRight">
                <label title="Assunto">Assunto:</label>
                <input type="text" name="assunto" id="assunto" title="Assunto" value="">
            </div>
        </div>
        <div class="FormRow">
            <div class="FormCellLeft">
                <label title="Nome">Estado:</label>
                <input type="radio" name="estado" value="todos"> Todos &nbsp;
                <input type="radio" name="estado" value="abertos"> Abertos &nbsp;
                <input type="radio" name="estado" value="fechados"> Fechados &nbsp; &nbsp;
            </div>
            <div class="FormCellRight">
            </div>
        </div>
    </fieldset>
    <div class="FormRow">
        <div class="FormCellLeft">
            <input type="button" class="BT_primary" style="font-size: 10px;" name="NewForm" id="NewForm" value="Adicionar Form"
                   onclick="addForm(this);"/>
        </div>
    </div>
    <jsp:include page="dynamicFormParamTemplate.jsp"/>
    <fieldset style="width:100%" id="dynamicForm" class="formGeralFieldset">
        <legend class="formGeralLegend">Propriedades de Formulário Dinamico</legend>

        <div class="FormRow">
            <label title="Nome">Formulário:</label>
            <select name="dynamicFormCombo" id="dynamicFormCombo"
                    onclick="updateFields(this);">
                <option value=""/>
                <c:forEach var="dynamicForm" items="${dynamicForms}">
                    <option value="${dynamicForm.id}">${dynamicForm.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="FormRow">
            <div class="FormCellLeft" style="width:22%;">
                <label title="Nome">Campo:</label>
                <select name="campoForm1Linha1" id="campoForm1Linha1" />
            </div>
            <div class="FormCellRight" style="width:77%;">
                <div class="FormCellLeft" style="width:22%;">
                    <label title="Nome">Operação:</label>
                    <select name="operacaoForm1Linha1" id="operacaoForm1Linha1" >
                        <option value="=">=</option>
                        <option value=">">&gt;  </option>
                        <option value="<">&lt;</option>
                        <option value="like">like</option>
                    </select>
                </div>
                <div class="FormCellRight" style="width:77%;">
                    <div class="FormCellLeft" >
                        <label title="Valor" style="width:20%;">Valor:</label>
                        <input type="text" style="width:65%;" name="valorForm1Linha1" title="valorForm1Linha1" value="">
                    </div>
                    <div class="FormCellRight">
                        <input type="button" class="BT_primary" style="width:12%;font-size: 10px;" name="duplicateIt" value="Nova Linha" onclick="duplicateLine(this);return false;"/>

                        <select name="logicOperatorLine1" id="logicOperatorLine1" style="min-width:12%;width:12%;" >
                            <option value="and">AND</option>
                            <option value="or">OR</option>
                        </select>

                    </div>
                </div>
            </div>
        </div>
    </fieldset>
