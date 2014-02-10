<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.servicoonline.histProcesso" var="histProcesso" />
<fmt:message key="ipdms.etapa.designacaosingular" var="etapaDes" />
<fmt:message key="ipdms.comunicacaoparecer.pesquisa.dataInicio" var="dataInicio" />
<fmt:message key="ipdms.comunicacaoparecer.pesquisa.dataFim" var="dataFim" />
<fmt:message key="ipdms.listetapas.resposta" var="resposta" />

<div class="row" style="text-align:left; padding-top:0px;">
    <table border="0" cellpadding="0" cellspacing="0" class="headings">
        <tbody>
          <tr>
            <td class="titulo1">${histProcesso} (id : ${servico.servicoonline.idProcessoEntidade})</td>
          </tr>
        </tbody>
    </table>					
</div>


<script type="text/javascript">
	var referer = '<%= org.apache.struts.util.RequestUtils.encodeURL(request.getContextPath() + "/historico.do2?" + (request.getQueryString() == null ? "" : request.getQueryString())) %>';
	var rules = {
		'#worklist tbody tr': function(el) {
			el.onmouseover = function(){
				Element.addClassName(this,'active-row')				
			};
			el.onclick = function(event){
				var queryString = '';
				var spanElement = this.select('span');
				if(spanElement.first()) {
					queryString += spanElement.first().innerHTML.split(',').join('&');
				}				
				queryString += "&referer=" + referer;
				window.location.href= '<%= request.getContextPath() %>/notification.do2?' + queryString;
			};
			el.onmouseout = function() {
				Element.removeClassName(this, 'active-row');
			};
		}
	};
	Behaviour.register(rules);
	Behaviour.addLoadEvent(function () {Behaviour.apply()});
</script>
<br />
<logic:present name="servico">
	<bean:define id="historicoList" name="servico" property="historicoList" />

	<display:table id="entry" name="${historicoList}" htmlId="worklist">
		<display:column title="${etapaDes}" sortable="true">
			<span style="display: none">processId=<bean:write name='entry' property='itemKey'/>,processType=<bean:write name='entry' property='itemType'/>,etapaId=<bean:write name='entry' property='numeroEtapa'/>,nid=<bean:write name='entry' property='nid'/></span>
			<bean:write name="entry" property="titulo" />
		</display:column>
 		<display:column title="${dataInicio}" sortable="true">	
 			<bean:write name="entry" property="beginDate" formatKey="dd-MM-yyyy"/>
 		</display:column>
		<display:column title="${dataFim}" sortable="true">
			<bean:write name="entry" property="endDate" formatKey="dd-MM-yyyy"/>
		</display:column>
		<display:column title="${resposta}" property="result" sortable="true"/>		
	</display:table>
</logic:present>