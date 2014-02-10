<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<bean:define id="currentcontent" name="currentcontent" scope="request" type="com.sinfic.kcms.datablock.conteudo.CConteudo"/>
<bean:define id="conteudo" name="currentcontent" property="conteudo"/>

<tiles:importAttribute name="language"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody>
		<bean:define id="localized">localizedData(${language})</bean:define>
	    <!-- TÍTULO DO CONTEÚDO -->
	    <tr>
	        <td class="texto" width="20%">
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.titulo.label" locale="locale"/>
	        </td>
	        <td class="texto" width="90%">
	        	<html:text property='${localized}.titulo' size="100" maxlength="250"/>
	        </td>
	    </tr>
	    <!-- SUB-TÍTULO DO CONTEÚDO -->
	    <tr>
	        <td class="texto" >
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.subtitulo.label" locale="locale"/>
	        </td>
	        <td class="texto">
	        	<html:text property='${localized}.subTitulo' size="100" maxlength="250" />
	        </td>
	    </tr>

	    <!-- DESCRIÇÃO CURTA DO CONTEÚDO -->
	    <logic:equal name="conteudo" property="tipoConteudo.usaDescricaoCurta" value="S">
	        <tr>
	            <td class="texto" >
	            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.descricaocurta.label" locale="locale"/>
	            </td>
	            <td class="texto" >
	            	<html:textarea property='${localized}.descricaoCurta' styleClass="txt11" cols="100" rows="4"></html:textarea>
	            </td>
	        </tr>
	    </logic:equal>
	    <!-- DESCRIÇÃO COMPRIDA DO CONTEÚDO -->
	   <logic:equal name="conteudo" property="tipoConteudo.usaDescricaoComprida" value="S">
	        <tr>
	            <td class="texto" colspan="2">
	              	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.descricaocomprida.label" locale="locale"/>
					<html:textarea styleId="${localized}.descricaoComprida" property="${localized}.descricaoComprida" style="border: 1px solid gray;height: 200px; width: 100%;" ></html:textarea>

	            	<table width="99.9%" bgcolor="ButtonFace">
	            		<tr>
	            			<td class="texto" style="color: 'darkblue'">
	            				<logic:present name="number">
			                		<logic:present name="currentcontent" property="filesImagens">
			                			<%
			                				String dc = currentcontent.getDescricaoComprida();
			                				java.util.ArrayList<String> list = new java.util.ArrayList<String>();
			                				for (int count = 0; count < 40; count++) {
			                					String tmp = "#img" + (count) +"#";
			                					if( dc.indexOf(tmp) != -1 ) {
			                						list.add(tmp);
			                					}
			                				}
			                			%>
			                			<strong><bean:message key="kcms.conteudo.ecraGlobalLocalizedData.inseririmagens" locale="locale"/><br /><br /></strong>
				                		<logic:iterate id="iter" name="currentcontent" property="filesImagens" indexId="i">
				                			<logic:notEmpty name="iter">
				                				&nbsp;&nbsp;<font color="blue"><%= list.get(i) %></font> <bean:message key="kcms.conteudo.ecraGlobalLocalizedData.corresponde" locale="locale"/>${iter.titulo}.${iter.extensao}<br />
				                			</logic:notEmpty>
				                		</logic:iterate>
			                		</logic:present>
			                	</logic:present>
	            			</td>
	            		</tr>
	            	</table>
				</td>
	        </tr>
			<logic:equal name="language" value="pt">
			        <!-- BOTÃO PARA DEFINIÇÃO DE IMAGENS -->
					<tr>
						<td class="texto" valign="middle" width="20%">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.definirimagens.label" locale="locale"/>
						</td>
						<td>
							<input name="processa"
								   title="<bean:message key="kcms.criarconteudo.help.message" locale="locale"/>"
								   type="button"
								   onclick="defineImagens(); "
								   value="<bean:message key="kcms.criarconteudo.definirimagens.botao" locale="locale"/>"
							/>
							<br />
							
							<c:set var="attachmentsNumber" value="${fn:length(currentcontent.anexosImagens)}" />
 							<c:forEach begin="0" end="10" varStatus="status">
								<div style="display: none;" id="imagem${status.index}">
									${status.index} :
									<c:choose>
										<c:when test="${status.index < attachmentsNumber}">
											<input type="text" name="imagem[${status.index}].description" size="30" 
												   value="${currentcontent.anexosImagens[status.index].titulo}" />
										</c:when>
										<c:otherwise>
											<input type="text" name="imagem[${status.index}].description" size="30" />
										</c:otherwise>
									</c:choose>
									<input name="imagem[${status.index}].formFile" size="30" type="file" />
									<br />
								</div>
							</c:forEach>
						</td>
					</tr>
			</logic:equal>
		</logic:equal>
	</tbody>
</table>
