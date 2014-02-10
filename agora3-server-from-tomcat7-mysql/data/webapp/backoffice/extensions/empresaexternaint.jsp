<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
            <td class="frasetitulo"><span class="titulos">Dados Empresa</span></td>
        </tr>
        <tr>
            <td align="right" class="texto">&nbsp;</td>
        </tr>
        <tr>
            <td class="texto" width="146">Morada</td>
            <td class="texto" width="272">
            	<html:text property="extension.morada"  size="100" />
		   </td>
        </tr>
        <tr>
            <td class="texto" >Código postal</td>
            <td class="texto" >
            	<html:text property="extension.codpostal" size="10" />
            </td>
        </tr>
        <tr>
            <td class="texto" >Telefone</td>
            <td class="texto" >
            	<html:text property="extension.telefone" size="20" maxlength="20" />
			</td>
        </tr>
        <tr>
            <td class="texto" >Fax</td>
            <td class="texto" >
            	<html:text property="extension.fax" size="20" maxlength="20" />
			</td>
        </tr>
        <tr>
            <td class="texto" >EMail</td>
            <td class="texto" >
            	<html:text property="extension.email" size="50" maxlength="50" />
			</td>
        </tr>
        <tr>
            <td class="texto" >Contacto</td>
            <td class="texto" >
            	<html:text property="extension.contacto" size="80" maxlength="80" />
			</td>
        </tr>
        <tr>
            <td class="texto" >Número Fiscal</td>
            <td class="texto" >
            	<html:text property="extension.numfiscal" size="15" maxlength="15" />
			</td>
        </tr>
        <tr>
            <td class="texto" >Homepage</td>
            <td class="texto" >
            	<html:text property="extension.homepage" size="80" maxlength="250"/>
			</td>
        </tr>
    </tbody>
</table>
                        