<html>
	<head>
		<title>Teste Estrutura Geográfica</title>
	</head>
	<body>
	
		<!--
		 -- Este teste requer configuração de uma estrutura geográfica Ln adequada
		 -- A accão vai buscar o handler para trabalhar com um objecto geográfico associado
		 -- à estrutura e reencaminha para o mapa de edição
		 -->
		
		<form action="${pageContext.request.contextPath}/sig/drawMap.do2" method="post">
			
			<br />
			<label>task</label>
			<br />
			<input name="task" value="edit" />
			
			<br />
			<label>geographicObjectHandlerClass</label>
			<br />
			<input name="geographicObjectHandlerClass" value="com.sinfic.ipdms.domain.entity.EstruturaGeograficaLn" />
			
			<br />
			<label>geographicObjectHandlerIdElement(estrutura.numero)</label>
			<br />
			<input name="geographicObjectHandlerIdElement(estrutura.numero)" value="49" />
			<br />
			<label>geographicObjectHandlerIdElement(ordem)</label>
			<br />
			<input name="geographicObjectHandlerIdElement(ordem)" value="0" />

			<br />
			<label>numeroConteudoEstrutura</label>
			<br />
			<input name="numeroConteudoEstrutura" value="29762" />
			
			<input type="submit" value="submit" />
			
		</form>
		
	</body>
</html>