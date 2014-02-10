<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<style>
	.contentLink2 {};
</style>
<table class="formtable">
  <tr class="listHeader">
  	<th class="formlabel">Enviada Por</th>
  	<th class="formlabel">Enviada Em</th>
  	<th class="formlabel">Titulo</th>
  </tr>
<tr class="formfield">
<logic:iterate name="mensagens" id="folder">
<nested:root name="folder">
 	<td><a href="javascript://nop/" class="contentLink2" ><span style="display: none" ><nested:write property="numero" /></span><nested:write property="from" /></a></td>
 	<td><a href="javascript://nop/" class="contentLink2" ><span style="display: none" ><nested:write property="numero" /></span><nested:write property="data" /></a></td>
 	<td><a href="javascript://nop/" class="contentLink2" ><span style="display: none" ><nested:write property="numero" /></span><nested:write property="titulo" /></a></td>
</nested:root>
</logic:iterate>
</tr>
</table>
<div id="htmlContent">
	<ajax:htmlContent
	  baseUrl="mailboxview.do2"
	  sourceClass="contentLink2"
	  target="mailboxlist"
	  parameters="numero={ajaxParameter}"
	  />
</div>
