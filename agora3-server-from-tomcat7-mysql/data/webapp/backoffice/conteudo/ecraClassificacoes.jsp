<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page errorPage="/backoffice/errors/error.jsp" %>

<script language="JavaScript" >
	function togglestat( img, objId )
	{
		var obj = document.getElementById(objId);
		var imgEntry = '${pageContext.request.contextPath}/backoffice/images';
		if ( img.aberto )
		{
			img.aberto = false;
			img.src = imgEntry + "/fold.gif";
			obj.style.display = 'none';
		}
		else
		{
			img.aberto = true;
			img.src = imgEntry + "/open.gif";
			obj.style.display = 'block';
		}
	}
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
            <td class="titulos" height="35" colspan="2"> 
				&nbsp;&nbsp;&nbsp;<bean:message key="kcms.classificacoes.titulo.label" locale="locale"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="texto" colspan="2">
            <logic:present name="classificacoes">
            	<logic:iterate id="classificacao" name="classificacoes" indexId="indexId">
	                <table border="0" width="100%" style="margin-left: 15px">
	                    <tbody>
							<tr>
	                            <td class="frasetitulo" width="25" valign="top">
	                            	<img src='${pageContext.request.contextPath}/backoffice/images/fold.gif' 
	                            		 border="0"
	                            		 style="cursor: hand" 
	                            		 onclick="togglestat(this, 'linha${indexId}') "
	                            	/>
	                            </td>
	                            <td class="texto" valign="top">
									${classificacao.titulo}
		                           	<bean:define id="codigo" name="classificacao" property="numeroConteudo" /> 
		                           	<br />
		    	                    <div id="linha${indexId}" style="display:none" >
			    	                    <logic:iterate id="conteudoClassificacao" name="classificacaoMap" property="${codigo}" indexId="indexC">
				                            	<bean:define id="numeroConteudo" name="conteudoClassificacao" property="numeroConteudo" />
				                            	<html:checkbox property="classificacao(${numeroConteudo})" styleId="c${codigo}" value="${numeroConteudo}"/>
				                            	<label for="c${codigo}" style="cursor: hand">
				                            		${conteudoClassificacao.titulo}
				                            	</label><br />
			    	                    </logic:iterate>
		    	                    </div>
    	                        </td>
	                        </tr>
    	                    
	                    </tbody>
	                </table>
                    <script language="JavaScript">document.getElementById('linha${indexId}').style.display='none'; </script>                
            	</logic:iterate>
            </logic:present>
        </tr>
    </tbody>
</table>
