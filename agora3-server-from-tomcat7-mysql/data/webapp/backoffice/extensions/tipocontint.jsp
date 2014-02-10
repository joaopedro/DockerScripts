<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page errorPage="/backoffice/errors/error.jsp" %>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tbody>
        <tr>
            <td class="titulos" colspan="2">Tipo de Conteúdo</td> 
        </tr>
        <tr>
            <td align="right" class="texto" width="180">&nbsp;</td>
            <td align="right" class="texto">&nbsp;</td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
	            <bean:message key="kcms.tipocontint.sistema.label" locale="locale"/>
             </td>
            <td align="left" class="texto"><html:checkbox property="extension.conteudoSistema" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.descricaocurta.label" locale="locale"/>
            </td>
            <td align="left" class="texto">
            	<html:checkbox property="extension.usaDescricaoCurta" value="S"/>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.descricaocomprida.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.usaDescricaoComprida" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.datainicio.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.usaDataInicio" value="S"/></td>
        </tr>
         <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.datafim.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.usaDataFim" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.idexterno.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.usaIdExterno" value="S"/></td>
        </tr>	       
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.novajanela.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.novaJanela" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.mostradescricaocurta.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.mostraDescricaoCurta" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.iniciapesquisa.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.startupList" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.classificacao.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.EClassificacao" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.comentarios.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.temComentario" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.pesquisavel.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.pesquisavel" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.rssfeeds.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.rssfeeds" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.explorador.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.explorador" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.expandeexplorador.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.exploradorExpansivel" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.banner.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.banner" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.instanciador.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.instanciavel" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.instanciasmultiplas.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.instanciaMultipla" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.datasexecucao.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.usaDataExecucao" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.preco.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.usaPreco" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.evento.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:checkbox property="extension.EEvento" value="S"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.tipoaprovacao.label" locale="locale"/>
            </td>
            <td align="left" class="texto">
            	<table width="90%">
            		<tr>
            			<td width="30%">
            				<html:radio property="extension.tipoAprovacao" value="G"/>
            				&nbsp;&nbsp;&nbsp;Hierarquia 
            			</td>
            			<td width="30%">
            				<html:radio property="extension.tipoAprovacao" value="W"/>
            				&nbsp;&nbsp;&nbsp;Workflow 
            			</td>
            			<td width="30%">
            				<html:radio property="extension.tipoAprovacao" value="N" />
            				&nbsp;&nbsp;&nbsp;<bean:message key="kcms.tipocontint.semworkflow.label" locale="locale"/> 
            			</td>
            		</tr>
            	</table>
            </td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.itensmostrar.label" locale="locale"/>
            </td>

            <td align="left" class="texto"><html:text property="extension.numItemsDisplay" size="4" maxlength="4"/></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.codigoworkflow.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:text property="extension.codWorkflow" size="50" maxlength="50" /></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.classesuporte.label" locale="locale"/>
            </td>
            <td align="left" class="texto"><html:text property="extension.classeSuporte" size="50" maxlength="254" /></td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	<bean:message key="kcms.tipocontint.ecras.label" locale="locale"/>
            </td>
            <td align="left" class="texto">
            	<table width="90%">
            		<tr>
            			<td width="30%">
            				<html:checkbox property="extension.ecraGlobal" value="S"/>
            				&nbsp;&nbsp;&nbsp;
            				<bean:message key="kcms.tipocontint.global.label" locale="locale"/> 
            			</td>
            			<td width="30%">
            				<html:checkbox property="extension.ecraExtensao" value="S"/>
            				&nbsp;&nbsp;&nbsp;
            				<bean:message key="kcms.extensoes.titulo.label" locale="locale"/> 
            			</td>
            			<td width="30%">
            				<html:checkbox property="extension.ecraAnexos" value="S"/>
            				&nbsp;&nbsp;&nbsp;
            				<bean:message key="kcms.anexos.titulo.label" locale="locale"/> 
            			</td>
            		</tr>
            		<tr>
            			<td>
            				<html:checkbox property="extension.ecraPerfil" value="S"/>
            				&nbsp;&nbsp;&nbsp;
            				<bean:message key="kcms.perfis.titulo.label" locale="locale"/> 
            			</td>
            			<td>
            				<html:checkbox property="extension.ecraClassificacao" value="S"/>
            				&nbsp;&nbsp;&nbsp;
            				<bean:message key="kcms.classificacoes.titulo.label" locale="locale"/> 
            			</td>
            			<td>
            				<html:checkbox property="extension.ecraRelacionamento" value="S"/>
            				&nbsp;&nbsp;&nbsp;
            				<bean:message key="kcms.relacionamentos.titulo.label" locale="locale"/> 
            			</td>
            		</tr>
            	</table>
            </td>
        </tr>
        
        <tr>
            <td align="left" class="texto" width="180">
            	Apresentação de itens :
            </td>
            <td align="left" class="texto">
            	<html:text property="extension.displayConteudo" maxlength="50"/>
            </td>
        </tr>
        
        <tr>
            <td align="left" class="texto" width="180">
            	Pesquisa de itens :
            </td>
            <td align="left" class="texto">
            	<html:text property="extension.pesquisar" maxlength="50"/>
            </td>
        </tr>
        
        <tr>
            <td align="left" class="texto" width="180">
            	Tipo de ordenação
            </td>
            <td align="left" class="texto">
            	<table width="60%">
            		<tr>
            			<td width="50%">
							<html:radio property="extension.tipoOrdenacao" value="S"></html:radio>
							&nbsp;&nbsp;&nbsp;
            				Standard 
            			</td>
            			<td width="50%">
							<html:radio property="extension.tipoOrdenacao" value="E"></html:radio>
							&nbsp;&nbsp;&nbsp;
            				Extensão 
            			</td>
            		</tr>
            	</table>
            </td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	Ordem da ordenação
            </td>
            <td align="left" class="texto">
            	<table width="60%">
            		<tr>
            			<td width="50%">
            				<html:radio property="extension.ordemOrdenacao" value="A"></html:radio>
							&nbsp;&nbsp;&nbsp;
            				Ascendente 
            			</td>
            			<td width="50%">
            				<html:radio property="extension.ordemOrdenacao" value="D"></html:radio>
							&nbsp;&nbsp;&nbsp;
            				Descendente 
            			</td>
            		</tr>
            	</table>
            </td>
        </tr>

        <tr>
            <td align="left" class="texto" width="180">
            	Campo de ordenação :
            </td>
            <td align="left" class="texto">
            	<html:text property="extension.campoOrdenacao" maxlength="50"/>
            </td>
        </tr>
        
    </tbody>
</table>
