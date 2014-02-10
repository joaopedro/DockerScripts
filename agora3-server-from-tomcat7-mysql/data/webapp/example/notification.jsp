<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<bean:write name="notification" property="body"  filter="false"/>
<br/><br/>
<b>Dados do Sistema de Origem (nome, valor):</b> ${notification.process.servicoOnline.aux1 }
<br/>

