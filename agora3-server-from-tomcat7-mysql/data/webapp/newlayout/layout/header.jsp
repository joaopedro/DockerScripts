<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="IMG_DIR" value="${CONTEXT_PATH}/newlayout/images" />

<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate var="currentDate" type="date" value="${now}" dateStyle="full" pattern="EEEE, dd.MM.yyyy" />
<fmt:message key="agora.process.create" var="create-process" />

<script type="text/javascript">
	$(document).ready(function () {
		$("#loggedUser").mouseenter(function(){
			$("#loggedUserMenu").toggle(); 
			$("#infoGeralMenu").hide();
		});
	
		$("#loggedUserMenu").mouseleave(function(){
			$("#loggedUserMenu").hide();
		});
		
		$("#infoGeral").mouseenter(function(){
			$("#infoGeralMenu").toggle();
			$("#loggedUserMenu").hide();
		});
	
		$("#infoGeralMenu").mouseleave(function(){
			$("#infoGeralMenu").hide();
		});
	});
	
	function changeFont(action){	
		var fontSize = parseInt($("body").css("font-size"));
		
		if(action == 'reduzir'){
			fontSize = fontSize - 1 + "px";
		    $("body").css({'font-size':fontSize});	
		}
		
		else if(action == 'aumentar'){
			fontSize = fontSize + 1 + "px";
		    $("body").css({'font-size':fontSize});
		}
	}
	
	function ajaxRequest(action){
		$(".ui-dialog-content").dialog("destroy");
		var minWidgetDiv = document.getElementById('minWidget-div');
		minWidgetDiv.style.display = "none";
		
		var mainBodyElems = $("#main-body *").not(".ui-resizable-handle");
		mainBodyElems.remove();
		
		$.ajax({
			type: 'GET',
		    url: '${pageContext.request.contextPath}' + action,
		    dataType: 'html',
		    beforeSend: function() {
				$("body").mask(fmtResources.loadingMsg);
			},
			complete: function() {
				$("body").unmask();
			},
		    error: function(transport) {
		    	console.log('Server side Error : ' + transport.status);
		    },
		    success: function(data) {
		      	$("#main-body").append(data);
		      	
		      	var leftDivWidth = document.getElementById ("process-nav-leftDiv").clientWidth;
				leftDivWidth += 10;
				$("#process-nav-padder").css('padding-left', leftDivWidth+"px");
		    }
		});
	}
</script>

<header>
<div id="header">
  <div id="Logo">
     <a href="${CONTEXT_PATH}/newlayout/homepage.do2">
     	<img src="${IMG_DIR}/logo_AGORA.png" width="159" height="30" alt="ÁGORA Systems">
     </a>
  </div>
  <div id="Pesquisa">
    <form id="Search">
      <p>
        ${currentDate}
        <span class="separador">
          | 
        </span>
        
		<a href="#" onclick="javascript:changeFont('reduzir')" class="fontMinus"></a>
		<a href="#" onclick="javascript:changeFont('aumentar')" class="fontMore"></a>
		        
        <span class="separador">
          | 
        </span>
        <a id="loggedUser" href="#" class="user"></a>
        <span>
          ${pageContext.request.username}
        </span>
        
        <a id="infoGeral" href="#" class="infoGeral">
        </a>
        <a href="${pageContext.request.contextPath}/j_acegi_logout" class="Out">
        </a>
      </p>
      <p>
        <input type="search" placeholder="Search">
        <input type="submit" value="" />
      </p>
    </form>
  </div>
  <div class="MenuTop">
    <ul id="Menu">
      <li>
        <a href="MeusProcessos.html">
          Inbox
        </a>
      </li>
      <li class="here">
        <a href="#" onclick="ajaxRequest('/newlayout/processeslist.do');">
            Criar Novo
        </a>
      </li>
      <li>
        <a href="#">
          Relatórios & Dashboard
        </a>
        <ul>
          <li>
            <a href="#">
              Relatórios
            </a>
          </li>
          <li>
            <a href="#">
              Dashboard
            </a>
          </li>
        </ul>
      </li>
      <li>
        <a href="#">
          Pesquisas
        </a>
        <ul>
          <li>
            <a href="#">
              Pesquisa Geral
            </a>
          </li>
          <li>
            <a href="#">
              Pesquisa Avançada
            </a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
  
  <div id="infoGeralMenu">
    <p>
      <a href="#">
        Ajuda
      </a>
    </p>
    <p>
      <a href="#">
        Sobre
      </a>
    </p>
  </div>
  <div id="loggedUserMenu">
    <p>
      Sign in
      <br/>
      Paula Calado
    </p>
    <p>
      <a href="#" onclick="ajaxRequest('/newlayout/editPersonalData.do2');">
        Alterar Dados Pessoais
      </a>
    </p>
    <p>
      <a href="#" onclick="ajaxRequest('/newlayout/editPersonalPreferences.do2');">
        Preferências Pessoais
      </a>
    </p>
    <p>
      <a href="#" onclick="ajaxRequest('/newlayout/mySearches.do');">
        As Minhas Pesquisas
      </a>
    </p>
    <p>
      <a href="#">
        Comentários Pessoais
      </a>
    </p>
    <p>
      <a href="${pageContext.request.contextPath}/j_acegi_logout">
        Sair
      </a>
    </p>
  </div>
  <div style="clear:both;">
  </div>
</div>
</header>