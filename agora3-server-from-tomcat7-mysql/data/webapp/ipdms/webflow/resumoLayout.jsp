<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.loading" var="loading" />

<%@ page contentType="text/html; charset=iso-8859-1" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<TITLE>${sessionScope.ipdms_sitetittle}</TITLE>


<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />

<LINK href='${THEMES_DIR}/estilos.css' type='text/css' rel='stylesheet'>
<LINK href='${THEMES_DIR}/forms.css' type='text/css' rel='stylesheet'>

</HEAD>
<body style="overflow: auto;">

<tiles:importAttribute />
	<table cellspacing="0" cellpadding="0" style="border:none;" class="tabelaMain" summary="tabela decorativa" width="100%">
	<tbody>
		<tr>
			<td class="main" >
				<TABLE id="main" width="100%" cellpadding="0" cellspacing="0" style="margin-bottom: 5px; margin-top:5px; margin-right:5px; border:none;" summary="tabela decorativa">
				<TBODY>
					<tr>
						<td rowspan="4" colspan="1"><img src="${IMG_DIR}/misc/1x1.gif" width="5px" height="1px" style="border:none" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td rowspan="4" colspan="1"><img src="${IMG_DIR}/misc/1x1.gif" width="5px" height="1px" style="border:none" /></td>
					</tr>
					<tr>
						<td style="vertical-align:top">
							<table cellpadding="0" cellspacing="0" style="border:none" width="100%" summary="tabela decorativa">
								<tbody>
									<tr>
										<td class="vTop"><img src="${IMG_DIR}/misc/1x1.gif" width="1px" height="420px" style="border:none" /></td>
										<td class="vTop"><table cellpadding="0" width="100%
										" cellspacing="0" style="border:none" class="tabelaPedidoDocumentacao" summary="tabela decorativa">
											<tbody>
												<tr>
													<td id="loading" style="display: none;">
														<div style="padding: 100px">
															<div style="text-align: center; font-size: 8pt">
																<b>${loading}</b><br /><br />
																<img src="${IMG_DIR}/misc/loading.gif" alt="${loading}" title="${loading}" />
															</div>
														</div>																	
												</td>
												<td id="mainBody">
													<%--
													<table width="640px" class="group_02" cellspacing="0" cellpadding="1">
														<tr>
													  		<td class="group_02" style="padding-Left:5px;" colspan="2">Identificação do Processo</td>
														</tr>
														<tr>
															<td class="formlabel">Número:</td>
															<td class="formfield">${webflowActionForm.servicoOnline.idProcessoEntidade}</td>
														</tr>
														<tr>
															<td class="formlabel">Tipo:</td>
															<td class="formfield">${webflowActionForm.variante.titulo}</td>
														</tr>
														<tr>
															<td class="formlabel">Data de Registo:</td>
															<td class="formfield"><bean:write name="webflowActionForm" property="servicoOnline.dataPreenchimento.time" format="dd-MM-yyyy HH'h'mm'm'"/></td>
														</tr>
														<tr>
															<td class="formlabel">Utilizador:</td>
															<td class="formfield">${webflowActionForm.servicoOnline.creator.titulo}</td>
														</tr>
													</table>
													 --%>
													<br/>
													<tiles:insert attribute="main-body" />													
												</td>
											</tr>
										</tbody>	
										</table>
										</td>
								</tr>
							</tbody>
							</table>
						</td>
					</tr>
				</tbody>
				</table>
		</td>
	</tr>
</tbody>
</table>
</body>
</html>