<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page errorPage="/backoffice/errors/error.jsp" %>

<form name="changeconteudo" action="changeconteudoreg.do2" method="post">
<TABLE border="0" width="100%">
	<TBODY>
		<TR>
			<TD class="titulos" colspan="2">
				<BR><BR>
				Mudança de Tipo de Conteúdo do Conteudo:
				<BR><BR>
			</TD>
		</TR>
		<TR>
			<TD colspan="2">
				${cont.titulo}
			</TD>
		</TR>
		<TR>
			<TD class="txt10normal" width="20%">
				Novo Tipo
			</TD>
			<TD>
				<input name="numero" type="hidden" value="${numero}">
				<select name="codtipo" size="1">
					<logic:iterate name="listcont" id="c">
						<option value="${c.numeroConteudo}">${c.titulo}</option>
					</logic:iterate>
				</select>
			</TD>
		</TR>
		<TR>
			<TD colspan="2" style="height: 50px">
				<input name="submeter" 
					   type="submit"
					   value=" <bean:message key="kcms.botao.submeter.label" locale="locale" /> "
					   class="styledButton"
				/>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</form>
