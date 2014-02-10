function registerdrapdropareas(dragpannel, droppannel, draggableElements) {
	// Make all the elements draggables from draggables division.
   $A($(dragpannel).getElementsByTagName(draggableElements)).each(
      function(item) {;
          new Draggable(
            item,
            {
               superghosting:true,
               revert: true
            }
         );
      }
   );

   $A($(droppannel).getElementsByTagName(draggableElements)).each(
      function(item) {
          new Draggable(
            item,
            {
               superghosting:true,
               revert: true
            }
         );
      }
   );

   Droppables.add(
     droppannel,
     {
    	
        hoverclass: 'hoverActive',
        onDrop: moveItem
     }
  );
   Droppables.add(
     dragpannel,
     {
    	
        hoverclass: 'hoverActive',
        onDrop: moveItem
     }
  );
}

function moveItem( draggable,droparea){
	 var idcode;
	    idcode=$(draggable.id.split("_")[1]);
	    
	    //if element has a 'confirmMoveMessage' attribute, ask for confirmation
	    if(draggable.getAttribute('confirmMoveMessage'))
	    	if(!confirm(draggable.getAttribute('confirmMoveMessage')))
	    		return;
		
	    //se destino for mesmo que origem
		if($(idcode).parentNode==droparea)
			return;
		//caso contrario remove elemento da origem e adiciona-se no destino	
		$(idcode).parentNode.removeChild($(idcode));		
		droparea.appendChild($(idcode));
	
		//ir buscar as todos os elementos P na droparea
		//var y=droparea.getElementsByTagName("p");
		//adicionar no inicio - nao funciona no IE
	    //droparea.insertBefore($(idcode),$(y[0]));
		new Effect.Highlight($(idcode).parentNode,
	 			{ startcolor: '#E7E8E9', endcolor: '#ffffff'});
		dropPostAction($(idcode),droparea);
}
