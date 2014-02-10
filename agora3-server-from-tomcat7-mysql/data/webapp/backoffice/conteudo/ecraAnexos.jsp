<%@page errorPage="/backoffice/errors/error.jsp" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<bean:define id="currentcontent" name="currentcontent" scope="request" type="com.sinfic.kcms.datablock.conteudo.CConteudo" />
<bean:define id="conteudo" name="currentcontent" property="conteudo"/>

<table border="0" cellspacing="0" cellpadding="0" >
    <tbody>
        <tr>
            <td class="titulos" colspan="4" height="30">
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Anexos
            </td>
        </tr>
        <c:if test="${not empty currentcontent.anexos}">
			<tr>
				<td height="20"></td>
	            <td align="left" class="subtitulos" colspan="2">${conteudo.titulo}<br></td>
	            <td class="texto"></td>
	        </tr>
	        <tr bgcolor="whitesmoke">
				<td height="20"></td>
	            <td align="left" class="texto" colspan="2"><strong>Este conteúdo tem os seguintes anexos já inseridos</strong></td>
	            <td class="texto">Eliminar</td>
	        </tr>        
        	<logic:iterate id="canexo" name="currentcontent" property="anexos" indexId="index">
		        <tr bgcolor="whitesmoke">
		            <td class="texto"></td>
	    	        <td>${canexo.titulo}</td>
        	    	<td><a href="${pageContext.request.contextPath}/docs/${canexo.fileName}" target="new">${canexo.fileName}</a></td>
	            	<td><html:multibox property='anexoAEliminar[${index}]' styleClass="texto">${canexo.codigo}</html:multibox></td>
		        </tr>
        	</logic:iterate>
        </c:if>
		<tr>
            <td colspan="4"  height="25"></td>
        </tr>
        <c:forEach begin="1" end="7" varStatus="status">
	        <tr>
	            <td valign="middle" class="texto" rowspan="3">Anexo &nbsp;&nbsp;&nbsp;</td>
	        </tr>
	        <tr>
	            <td class="texto">Ficheiro&nbsp;&nbsp;&nbsp;</td>                
	            <td class="texto" colspan="3" >
	            	<input name="anexo(new${status.index}).description" size="50" maxlength="80" type="text" /> 
	            	<input name="anexo(new${status.index}).formFile" size="20" type="file" />
	            </td>
	        </tr>
	        <tr>
	 			<td class="texto">Thumbnail&nbsp;&nbsp;&nbsp;</td>                
				<td class="texto" colspan="3" >
	            	<input name="anexo(new${status.index}).thumbnail.description" size="50" maxlength="20" type="text" /> 
	            	<input name="anexo(new${status.index}).thumbnail.formFile" size="20" type="file" />
	            </td>
			</tr>            
	        <tr>
				<td class="texto" colspan="5" ><hr></td>
			</tr>  
        </c:forEach>
        <logic:present name="currentcontent" property="files">
			<tr>
	        	<td></td> 
	        	<td colspan="3" height="30" valign="middle">
	        		<strong>Anexos a inserir</strong>
	        	</td>
	        </tr>
	        <tr>
    	        <td></td>
        	    <td class="texto" colspan="3">
        	    	<ul>
						<logic:iterate id="file" name="currentcontent" property="files">
							<logic:present name="file" >
			            		<li>${file.titulo}</li>
		            		</logic:present>
	            		</logic:iterate>
					</ul>
	            </td>
    	    </tr>
        </logic:present>
		<tr>
            <td colspan="4" height="15"></td>
        </tr>
    </tbody>
</table>
