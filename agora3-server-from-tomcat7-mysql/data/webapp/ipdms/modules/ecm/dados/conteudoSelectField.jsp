<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<select name="conteudo" id="conteudo" style="width: 200px">
	<c:forEach items="${conteudosList}" var="conteudo">
		<option value="${conteudo.descricaoConteudo}">${conteudo.descricaoConteudo}</option>
		
		<c:set var="descricaoConteudo" value="${conteudo.descricaoConteudo}"/>
		<c:set var="codigoConteudo" value="${conteudo.codigoConteudo}"/>
		
		<c:set var="texto_curto_1" value="${conteudo.texto_curto_1.descricao}"/>
		<c:set var="texto_curto_2" value="${conteudo.texto_curto_2.descricao}"/>
		<c:set var="texto_curto_3" value="${conteudo.texto_curto_3.descricao}"/>
		<c:set var="texto_curto_4" value="${conteudo.texto_curto_4.descricao}"/>
		
		<c:set var="texto_longo_1" value="${conteudo.texto_longo_1.descricao}"/>
		<c:set var="texto_longo_2" value="${conteudo.texto_longo_2.descricao}"/>
		<c:set var="texto_longo_3" value="${conteudo.texto_longo_3.descricao}"/>
		<c:set var="texto_longo_4" value="${conteudo.texto_longo_4.descricao}"/>
		
		<c:set var="inteiro_1" value="${conteudo.inteiro_1.descricao}"/>
		<c:set var="inteiro_2" value="${conteudo.inteiro_2.descricao}"/>
		<c:set var="inteiro_3" value="${conteudo.inteiro_3.descricao}"/>
		<c:set var="inteiro_4" value="${conteudo.inteiro_4.descricao}"/>
		<c:set var="inteiro_5" value="${conteudo.inteiro_5.descricao}"/>
		<c:set var="inteiro_6" value="${conteudo.inteiro_6.descricao}"/>
		<c:set var="inteiro_7" value="${conteudo.inteiro_7.descricao}"/>
		<c:set var="inteiro_8" value="${conteudo.inteiro_8.descricao}"/>
		
		<c:set var="data_1" value="${conteudo.data_1.descricao}"/>
		<c:set var="data_2" value="${conteudo.data_2.descricao}"/>
		<c:set var="data_3" value="${conteudo.data_3.descricao}"/>
							
		<script>
			conteudosArray["${descricaoConteudo}"] = {
				codigoConteudo:'${codigoConteudo}',
				
				texto_curto_1:'${texto_curto_1}',
				texto_curto_2:'${texto_curto_2}',
				texto_curto_3:'${texto_curto_3}',
				texto_curto_4:'${texto_curto_4}',
				
				texto_longo_1:'${texto_longo_1}',
				texto_longo_2:'${texto_longo_2}',
				texto_longo_3:'${texto_longo_3}',
				texto_longo_4:'${texto_longo_4}',
				
				inteiro_1:'${inteiro_1}',
				inteiro_2:'${inteiro_2}',
				inteiro_3:'${inteiro_3}',
				inteiro_4:'${inteiro_4}',
				inteiro_5:'${inteiro_5}',
				inteiro_6:'${inteiro_6}',
				inteiro_7:'${inteiro_7}',
				inteiro_8:'${inteiro_8}',
				
				data_1:'${data_1}',
				data_2:'${data_2}',
				data_3:'${data_3}'							
			};
		</script>
				
	</c:forEach>
</select>