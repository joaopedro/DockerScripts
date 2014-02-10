<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<style>
	.contentLink {};
</style>
<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
   <table style="border:none" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
	  <tr>
	    <td class="titulo1">Caixa do Correio</td>
	    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="Ajuda" title="Ajuda" /></td>
	  </tr>
	</tbody>
   </table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">Caixa do Correio</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="Ocultar Ajuda" title="Ocultar Ajuda" /></td>
		  </tr>
		</tbody>
	</table>	
	<ul>
		<li> Lista de Mensagens </li>
	</ul>				
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<br />

<table class="formtable">

  <tr class="listHeader">
  	<th class="formlabel">Ocções</th>
  </tr>
<tr class="formfield">
<logic:iterate name="folders" id="folder">
<nested:root name="folder">
	  	<td>&nbsp;
	  		<a href="javascript://nop/" class="contentLink" ><nested:write property="descricao" /></a>
	  	</td>
</nested:root>
</logic:iterate>
</tr>
</table>
<div id="mailboxlist"></div>
<div id="htmlContent">
	<ajax:htmlContent
	  baseUrl="mailboxdo.do2"
	  sourceClass="contentLink"
	  target="mailboxlist"
	  parameters="list={ajaxParameter}"
	  />
</div>
