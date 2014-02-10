/**
* Este ficheiro contém uma função Javascript que permite fazer o set do value de um 
* elemento, de acordo com o seu tipo.
**/

//set the input values to the screen elements from popup	
function setInputValue(inputElement, value)
{		
	//check if the element is not null
	if(inputElement) {

		var elemType = inputElement.tagName;
		
		//input element
		if(elemType == 'INPUT') {
			inputElement.value = value;
		}
		//div element
		else if(elemType == 'DIV' || elemType == 'SPAN') {
			inputElement.innerHTML = value;
		}	
						
	}
}