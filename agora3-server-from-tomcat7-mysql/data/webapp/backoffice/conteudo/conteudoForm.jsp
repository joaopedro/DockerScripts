<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<bean:define id="currentcontent" name="currentcontent" scope="request" type="com.sinfic.kcms.datablock.conteudo.CConteudo"/>
<bean:define id="conteudo" name="currentcontent" property="conteudo"/>

<script type="text/javascript" language="JavaScript">
	var paneis = new Array();
	var editors = new Array();
	
	<logic:equal name="conteudo" property="tipoConteudo.ecraGlobal" value="S">
		paneis.push('global');
		<logic:present name="linguas">
			<logic:iterate id="lingua" name="linguas">
				paneis.push('localizedData(${lingua.idExterno})');
			</logic:iterate>
		</logic:present>
		<logic:notPresent name="linguas">
			paneis.push('localizedData(pt)');
		</logic:notPresent>
	</logic:equal>
	<logic:equal name="conteudo" property="tipoConteudo.ecraExtensao" value="S">
		paneis.push('extensao');
	</logic:equal>
	<logic:equal name="conteudo" property="tipoConteudo.ecraAnexos" value="S">
		paneis.push('anexos');
	</logic:equal>
	<logic:equal name="conteudo" property="tipoConteudo.ecraPerfil" value="S">
		paneis.push('perfis');
	</logic:equal>
	<logic:equal name="conteudo" property="tipoConteudo.ecraRelacionamento" value="S">
		paneis.push('relacionamentos');
	</logic:equal>	
	<logic:equal name="conteudo" property="tipoConteudo.ecraClassificacao" value="S">
		paneis.push('classificacoes');	
	</logic:equal>		
	
	window.onload = function () {
		if (paneis.length == 1) {
			showTab(showTab(paneis[0], paneis))
		}
	};
	
	var submitted = false;	
	function submitForm(form){
		if (!submitted) {

			if (editors) {
				for (i = 0; i < editors.length; i++) {
					var editor = editors[i];
					editor._textArea.value = editor.getHTML();
				}		
			}
			submitted = true;
			return true;
		}
		return false;
	}
</script>
<h1>
	<logic:present name="currentcontent" property="numeroConteudo">
		<bean:message key="kcms.criarconteudo.editar" arg0="${conteudo.titulo}" />
	</logic:present>
	<logic:notPresent name="currentcontent" property="numeroConteudo">
		<bean:message key="kcms.criarconteudo.criar" arg0="${conteudo.tipoConteudo.titulo}" />
	</logic:notPresent>
</h1>
<html:messages id="message">
	<bean:write name="message" />
</html:messages>
<html:form action="/editarConteudo" enctype="multipart/form-data">
	<html:hidden property="numeroConteudo" />
	<html:hidden property="versaoConteudo" />
	<html:hidden property="codTipoConteudo" />	
	<html:hidden property="page" value="1" />
	<html:hidden property="method" value="save" />
	
	<div id="header" style="width:100%">
		<ul id="primary" style="width:100%">	
			<logic:equal name="tipoConteudo" property="ecraGlobal" value="S">
				<li>
					<a id='global-label' href="javascript:;" onclick="showTab('global', paneis);" class="current">Global</a>
				</li>
				<logic:present name="linguas">
					<logic:iterate id="lingua" name="linguas">
						<bean:define id="panel">localizedData(${lingua.idExterno})</bean:define>
						<li>
							<a id='${panel}-label' href="javascript:;" onclick="showTab('${panel}', paneis);" class="">Global <bean:write name="lingua" property="idExterno" /></a>
						</li>
					</logic:iterate>
				</logic:present>
				<logic:notPresent name="linguas">
					<li>
						<a id='localizedData(pt)-label' href="javascript:;" onclick="showTab('localizedData(pt)', paneis);" class="">Global PT</a>
					</li>
				</logic:notPresent>			
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraExtensao" value="S">
				<li>
					<a id="extensao-label" href="javascript:;"  onclick="showTab('extensao', paneis);" class="">Extensão</a>
				</li>
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraAnexos" value="S">
				<li>
					<a id="anexos-label" href="javascript:;"  onclick="showTab('anexos', paneis);" class="">Anexos</a>
				</li>
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraPerfil" value="S">
				<li>
					<a id="perfis-label" href="javascript:;"  onclick="showTab('perfis', paneis);" class="">Perfis</a>
				</li>
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraRelacionamento" value="S">
				<li>
					<a id="relacionamentos-label" href="javascript:;"  onclick="showTab('relacionamentos', paneis);" class="">Relacionamentos</a>
				</li>
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraClassificacao" value="S">
				<li>
					<a id="classificacoes-label" href="javascript:;"  onclick="showTab('classificacoes', paneis);" class="">Classificações</a>
				</li>		
			</logic:equal>	
		</ul>
	</div>
	
	<div id="main">
		<div id="contents">
			<logic:equal name="conteudo" property="tipoConteudo.ecraGlobal" value="S">
				<div id="global">
					<tiles:insert page="/backoffice/conteudo/ecraGlobal.jsp" />
				</div>
				<%--
					Estes tabs são escondidos no método initDocument criado em ecraGlobal.jsp.
					
					Não deverão estar, por default, escondidos. O editor (htmlarea) não funciona caso
					estes tabs fiquem escondidos por default.
				--%>
				<logic:present name="linguas">
					<logic:iterate id="lingua" name="linguas">
						<bean:define id="panel">localizedData(${lingua.idExterno})</bean:define>
						<div id="${panel}">
							<tiles:insert page="/backoffice/conteudo/ecraGlobalLocalizedData.jsp" flush="false">
								<tiles:put name="language" beanName="lingua" beanProperty="idExterno" />
							</tiles:insert>
						</div>
					</logic:iterate>
				</logic:present>
				<logic:notPresent name="linguas">
					<div id="localizedData(pt)">
						<tiles:insert page="/backoffice/conteudo/ecraGlobalLocalizedData.jsp" flush="false">
							<tiles:put name="language" value="pt" />
						</tiles:insert>
					</div>
				</logic:notPresent>			
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraExtensao" value="S">
				<logic:present name="tipoConteudo" property="classeSuporte">
					
					<bean:define id="editAction"><bean:write name="<%= org.apache.struts.Globals.MODULE_KEY %>" property="prefix" />/extensions/<bean:write name="currentcontent" property="contentInterface.inputForm" /></bean:define>
					<div id="extensao" style="display:none">
						<tiles:insert page="${editAction}.do2?method=prepareEdit" flush="false"></tiles:insert>
					</div>
				</logic:present>
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraAnexos" value="S">
				<div id="anexos" style="display:none">
					<tiles:insert page="/backoffice/conteudo/ecraAnexos.jsp" flush="false" />
				</div>
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraPerfil" value="S">
				<div id="perfis" style="display:none">
					<tiles:insert page="/backoffice/conteudo/ecraPerfis.jsp" flush="false"/>
				</div>
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraRelacionamento" value="S">
				<div id="relacionamentos" style="display:none">
					<tiles:insert page="/backoffice/conteudo/ecraRelacionamentos.jsp" />
				</div>
			</logic:equal>
			<logic:equal name="conteudo" property="tipoConteudo.ecraClassificacao" value="S">
				<div id="classificacoes" style="display:none">
					<tiles:insert page="/backoffice/conteudo/ecraClassificacoes.jsp" />
				</div>
			</logic:equal>
		</div>
	</div>
	<p>  
		<html:submit property="submeter" styleClass="styledButton" 
					 onmouseover="changeImage(this, 1);" 
    				 onmouseout="changeImage(this, 2);"
    				 onclick="return submitForm(this)"
    				 ><bean:message key="kcms.conteudo.conteudoForm.submeter" /></html:submit>        									   
	</p>
</html:form>
<div id="choosebox" class="dragableElement" style="visibility: hidden; display: none; position: absolute; background-color: #fff4bc; z-index: 20; border: solid; border-width: 1px"></div>
