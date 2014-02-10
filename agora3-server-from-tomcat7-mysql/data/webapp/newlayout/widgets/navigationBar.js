//Tabs de processos
//lista de processos que aparece no scroller das tabs de processos
var processesList = document.createElement("ul");
processesList.id = "ProcessesTabsScroller-list";
document.body.appendChild(processesList);

$(processesList).mouseleave(function(){
	$(processesList).hide();
});

function showProcessesList(el){
	$("#ProcessesTabsScroller-list").show().position({
		my: "left top",
		at: "left bottom",
		of: el
	});
};

//scroller das tabs de processos
function scrollProcessesTab(to){
	if(to == "left"){
		var leftPos = $('#ProcessesTab-content').scrollLeft();
		$("#ProcessesTab-content").animate({scrollLeft: leftPos - 200}, 100);
	}
	else if(to == "rigth"){
		var leftPos = $('#ProcessesTab-content').scrollLeft();
		  $("#ProcessesTab-content").animate({scrollLeft: leftPos + 200}, 100);
	}
}

function isContainerScrolled(){
	var container = document.getElementById ("ProcessesTab-content");
	var containerScrolled = container.scrollWidth > container.clientWidth;
	
	return containerScrolled;
}

function toggleProcessesTabsScroller(){
	$("#ProcessesTabsScroller").toggle();
	
	var leftDivWidth = document.getElementById ("process-nav-leftDiv").clientWidth;
	leftDivWidth += 10;
	$("#process-nav-padder").css('padding-left', leftDivWidth+"px");		
}

//controla a visibilidade do scroller das tabs de processos quando há um resize da janela
window.onresize=function(){
	if(isContainerScrolled() && !($("#ProcessesTabsScroller").is(":visible"))){
		toggleProcessesTabsScroller();
	}
	else if(!isContainerScrolled() && $("#ProcessesTabsScroller").is(":visible")){
		toggleProcessesTabsScroller();
	}
};