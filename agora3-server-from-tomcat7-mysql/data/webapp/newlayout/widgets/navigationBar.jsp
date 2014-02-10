<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/newlayout/images" />

<style>	
	.noTitle .ui-dialog-titlebar {
		display: none;
	}
	
	.ui-dialog .ui-dialog-content {
		padding-top: 0px !important;
	}
</style>

<script>
	var fmtResources = {
		loadingMsg: '<fmt:message key="agora.loading"/>'
	};
	
	var javaVariables = {
		contextPath: '${pageContext.request.contextPath}',
		imgDir: '${IMG_DIR}',
		user: '${pageContext.request.remoteUser}'
	};
</script>

<script src='${pageContext.request.contextPath}/newlayout/widgets/widgets.js' type="text/javascript"></script>
<script src='${pageContext.request.contextPath}/newlayout/widgets/navigationBar.js' type="text/javascript"></script>

<script>	
	function toggleTab(tabName){
		$("#MenuTab li").each(function() {
			if($(this).text() == tabName){
				$(this).addClass("here");
			}
			else{
				$(this).removeClass("here");
			}
		});
	}
	
	$(document).ready(function() {
		//notificações do websocket - inicializa escondido - não funciona bem se for feito com css
		$("#newProcessNotification").hide();
		
		//carrega as definições do utilizador
		var tabsCookie = readCookie('tabs');
		if(tabsCookie != null){
			tabsDefs = JSON.parse(tabsCookie);
			
			var menuTab = document.getElementById('MenuTab');
			var processesTabsScroller = document.getElementById('ProcessesTabsScroller');

			//renderiza as TABs
			for(var i=0;i<tabsDefs.tabs.length;i++){				
				if(tabsDefs.tabs[i].awareness == undefined){			
					var li = document.createElement("li");
		
					var a = document.createElement('a');
					a.innerHTML = tabsDefs.tabs[i].tabName;
			        a.href =  '#';
					a.onclick = function(){					
						for(var i=0;i<tabsDefs.tabs.length;i++){
							if(tabsDefs.tabs[i].tabName == $(this).text()){
								renderWidgets(i, tabsDefs.tabs[i].widgets);
								toggleTab(tabsDefs.tabs[i].tabName);
							}
						}
					}
					
					li.appendChild(a);
					
					if(!tabsDefs.tabs[i].visible){
						li.style.display = "none";
					}
					
					menuTab.insertBefore(li,processesTabsScroller);
				}				
			}
			
			//marca a primeira TAB visível como activa
			var firstTab = $('#MenuTab li:visible').first();
			firstTab.addClass('here');
			
			//renderiza os Widgets da primeira TAB não aware visível
			for(var i=0;i<tabsDefs.tabs.length;i++){
				if(tabsDefs.tabs[i].awareness == undefined && tabsDefs.tabs[i].visible){
					var widgets = tabsDefs.tabs[i].widgets;
 					renderWidgets(i, widgets); 					
 					break;
				}
			}
		}
	});
</script>

<nav>
<div id="process-nav">
	<div id="process-nav-leftDiv">
		<ul id="MenuTab">
	      <li id="ProcessesTabsScroller" class="process" style="display:none;">
			<a href="#">		  
			  <input name="" type="button" value="<" class="more" onclick="javascript:scrollProcessesTab('left')" >
			  <input name="" type="button" value=">" class="more" onclick="javascript:scrollProcessesTab('rigth')" >
			  <input name="" type="button" value="+" class="more" onclick="javascript:showProcessesList(this)" >
			</a>
		  </li>
	    </ul>
	</div>
	
	<div id="process-nav-rightDiv">
	    <div id="process-nav-padder">
	        <div id="ProcessesTab-content">
	        	<ul id="ProcessesTab"></ul>
	        </div>
	    </div>
	</div>
 </div> 
  <!--End Menu -->
</nav>

<div id="newProcessNotification" style="position:fixed; bottom:0px; right: 10px;" class="ui-widget-content ui-corner-all">
  <p style="padding:0 10px 0 10px;font-size:0.75em;">
    Novo Processo
  </p>
</div>