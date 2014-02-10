<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>


<%@page import="com.sinfic.kcms.userinfo.CSessionInfo"%>
<%@page import="com.sinfic.kcms.security.KCMSContext"%><script language="javascript">
function submitform( frm )
{
	if ( frm.password.value != frm.checkpassword.value )
		{
		alert('A password e a sua verificação diferem; corrija, por favor' );
		return false;
		}

	if ( !verify( frm ) )
		return;
	frm.submit()
}
</script>
<h1>Dados Colaborador</h1>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody>
		<logic:greaterThan name="conteudoForm" property="numeroConteudo" value="0">
            <tr>
                <td class="texto" >
                	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.login.label" locale="locale"/>
                </td>
                <td class="texto">
                	<html:hidden property="extension.login"/>
					${conteudoForm.extension.login}
                </td>
            </tr>
		</logic:greaterThan>
		<logic:equal name="conteudoForm" property="numeroConteudo" value="0">
	        <tr>
	            <td class="texto">
	            	&nbsp;&nbsp;&nbsp;&nbsp;Login
	            </td>
	            <td class="texto">
					<html:text property="extension.login"  size="30" maxlength="30"/>
	            </td>
	        </tr>
		</logic:equal>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.morada.label" locale="locale"/>
            </td>
            <td class="texto">
            	<html:textarea property="extension.moradautilizador" rows="4" cols="70"></html:textarea>
			</td>
        </tr>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.telefone.label" locale="locale"/>
            </td>
            <td class="texto">
            	<html:text property="extension.telefoneutilizador" size="20" maxlength="20" />
            </td>
        </tr>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.localidade.label" locale="locale"/>
            </td>
            <td class="texto">
            	<html:text property="extension.localidade" size="50" maxlength="50" />
            </td>
        </tr>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.codpostal.label" locale="locale"/>
            </td>
            <td class="texto">
            	<html:text property="extension.codpostal" size="10" maxlength="10" />
            </td>
        </tr>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.distrito.label" locale="locale"/>
            </td>
            <td class="texto">
            	<html:text property="extension.distrito" size="50" maxlength="50" />
            </td>
        </tr>
        <tr>
            <td class="texto" >
           		&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.telemovel.label" locale="locale"/>
            </td>
            <td class="texto">
                <html:text property="extension.telemovelutilizador" size="20" maxlength="20" />
            </td>
        </tr>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.fax.label" locale="locale"/>
            </td>
            <td class="texto">
                <html:text property="extension.faxutilizador" size="20" maxlength="20" />
            </td>
        </tr>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.email.label" locale="locale"/>
            </td>
            <td class="texto">
                <html:text property="extension.email" size="20" maxlength="50" />
            </td>
        </tr>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.cargo.label" locale="locale"/>
            </td>
            <td class="texto">
            	<html:text property="extension.cargo" size="50" maxlength="50" />
            </td>
        </tr>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.entidade.label" locale="locale"/>
            </td>
            <td class="texto">
            	<html:text property="extension.entidade" size="30" maxlength="30" />
            </td>
        </tr>
        <tr>
            <td align="left" class="texto" width="180">
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.interno.label" locale="locale"/>
            </td>
            <td align="left" class="texto">
            	<html:multibox property="extension.interno" value="I" />
        </tr>

        <% 
	        CSessionInfo log = (CSessionInfo) KCMSContext.getCurrentUser();
        	if ( log.isSuperUser() == true )
         	{ 
         %>
        <tr>
            <td align="left" class="texto" width="180">
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.superuser.label" locale="locale"/>
            </td>
            <td align="left" class="texto">
            	<html:multibox property="extension.superuser" value="S" />
            </td>
        </tr>
        <% 
        	} 
        %>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.password.label" locale="locale"/>
            </td>
            <td class="texto">
            	<html:password property="extension.password" size="50" redisplay="false"></html:password>
            </td>
        </tr>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.colaboradorint.repetirpassword.label" locale="locale"/>
            </td>
            <td class="texto">
            	<html:password property="extension.checkPassword" size="50" redisplay="false"></html:password>
			</td>
        </tr>
    </tbody>
</table>
