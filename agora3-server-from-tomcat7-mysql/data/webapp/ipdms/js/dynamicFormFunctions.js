/*
 * Javascript integration for filling dynamic forms
 * using jquery
 */
//give control of $ back to the other libraries
jQuery.noConflict();

//Escapes special characters and returns a valid jQuery id selector
jqEscapeSelector=function(str)
{

	return str.replace(/([;&,\.\+\*\~':"\!\^#$%@\[\]\(\)=>\|])/g, '\\$1');
};

//method for converting the decimal separator to default
parseDecimalSeparator=function(separator,elemValue){


	var number=elemValue.replace(separator,".");

	//return new default separator number
	return number;
};

//method for reverting the decimal separator to the choosen 
parseRevertDecimalSeparator=function(separator,elemValue){

	var stringElemValue=String(elemValue);

	var number=stringElemValue.replace(".",separator);

	//return new default separator number
	return number;
};

//calculate result of table of fields
totalizerTableFields=function(separatorJSTL,decimalsizeJSTL,totalizerJSTL, currentIdJSTL){


	//decimal separator 
	var separator=separatorJSTL;

	//totalizer field column
	var tablecolumn=totalizerJSTL;

	//get table  
	var table=tablecolumn.split(".")[0];
	//get field 
	var tableField=tablecolumn.split(".")[1];

	//set jquery selector for getting the id of the field inside
	//the table e.g.: tableid[0].fieldid
	//so we going to get all elements where id starts with tableid and
	//ends with fieldid

	var selectorStr='input[id^='+table+']&[id$='+tableField+']';

	//for each input item link keyup event
	jQuery(document).on('keyup',selectorStr,function(event) {

		//get all elements from column
		var elements=jQuery(selectorStr);

		//total value
		var total=0.00;			

		//for each element get 
		for (var i=0;i<elements.length;i++)
		{ 
			//get current value in input element
			var numberFromInput=elements[i].value;
			var current;


			//if there are decimal places defined
			if(decimalsizeJSTL>0){
				//replace separator from input to the default one
				var number=parseDecimalSeparator(separator,numberFromInput);
				//convert to float
				current=parseFloat(number);
			}else{
				//otherwise to int
				current=parseInt(numberFromInput);
			}

			//if current evaluated to false(NaN) return 0
			//increment total with current/0
			total += current || 0;

		}

		//refresh input int field value
		//set size of decimal places
		var valueDecimalPlaces=total.toFixed(decimalsizeJSTL);

		//set separator to the one defined from server for this field
		var valueSeparator=parseRevertDecimalSeparator(separator,valueDecimalPlaces);
		//refresh field with total value with the separator defined
		jQuery('#'+jqEscapeSelector(currentIdJSTL)).val(valueSeparator);
	});	 			

};

//method for calculating math expression based on the id input fields
//given on the int definition field
calculateExpression=function(separatorJSTL,decimalsizeJSTL,expressionJSTL, currentIdJSTL){

	//decimal separator
	var separator=separatorJSTL;
	//get expression from expressionField containing the math expression
	//e.g.: (timezone*timelapse)-time			
	var expressionField=expressionJSTL;	
	//$('elem1')+$('elem2')...etc
	var formatedExpression=expressionField;	
	//split it from math symbols to retrive the input id references
	//array e.g: ->timezone
	//			 ->timelapse
	//			 ->time
	var fieldElems= expressionField.split(/[\s()*/%+-]+/g);	
	//remove null positions from string array
	fieldElems=fieldElems.filter(Boolean);

	//create array for holding htlm elements objects based on fieldElems 
	var htmlFieldElems=[];

	//id of current input element that houses the expression
	var id=String(currentIdJSTL);

	//var selector="";

	for(var i=0, fields=fieldElems.length; i<fields; i++){

		//current field id
		var current=fieldElems[i];

		if(id.indexOf("[")!==-1){

			if(window["indexTable"]>0){

				id=id.replace(/\[(\d+)\]/g,"["+window["indexTable"]+"]")
			}
			current=current.replace(/^/,id.split(".")[0]+".");
		}	
		//create string expression to be replaced and evaled
		var formatedStr="parseFloat(parseDecimalSeparator('"+separator+"',jQuery('#'+jqEscapeSelector('"+current+"')).val()))";			

		//selector=selector.concat("#"+jqEscapeSelector(current)+":last,");
		//add html object to array of html elems 
		htmlFieldElems.push(jQuery('#'+jqEscapeSelector(current)));		
		//build expression for using with eval(javascript 1.6)
		formatedExpression=formatedExpression.replace(new RegExp("\\b"+fieldElems[i]+"\\b", "g"),formatedStr);
		//reset indexTable value
		window["indexTable"]=0;

	}	

	//for each referenced input ,selector.substring(0,selector.length-1)
	jQuery(htmlFieldElems).each(function() {
		//set keyup event for involved fields in the expression
		jQuery(this).on("keyup",function(event) {		


			var matchesidnumber=jQuery(this).attr('id').match(/\[(.d?)\]/);

			if(matchesidnumber){

				var idnumber=matchesidnumber[1];

				currentIdJSTL=currentIdJSTL.replace(/\[(.d?)\]/,"["+idnumber+"]");
				formatedExpression=formatedExpression.replace(/\[(\d+)\]/g,"["+idnumber+"]");
			}

			//evaluate expression and format with decimal size
			var evaledExpression=eval(formatedExpression).toFixed(decimalsizeJSTL);			
			//is it's a number(not an NaN)
			if(!isNaN(evaledExpression)){
				//refresh the expression input value with result and selected decimal separator
				jQuery('#'+jqEscapeSelector(currentIdJSTL)).val(parseRevertDecimalSeparator(separator,evaledExpression));

			}else{
				//otherwise set final value to empty
				jQuery('#'+jqEscapeSelector(currentIdJSTL)).val("");
			}

			//set trigger to target input in case it's being used as totalizer table column
			if(jQuery('#'+jqEscapeSelector(currentIdJSTL)).is(':disabled')){

				jQuery('#'+jqEscapeSelector(currentIdJSTL)).attr('disabled',false).trigger('keyup');

				jQuery('#'+jqEscapeSelector(currentIdJSTL)).attr('disabled',true);
			}
			jQuery('#'+jqEscapeSelector(currentIdJSTL)).trigger('keyup');

		});
	});	
};

//method to add new row to tableoffields
addTableRow= function(tableid){

	//jquery selector get table tbody with id testTable
	var table=jQuery('table[id="'+tableid+'"] >tbody');

	//get last row containing input fields with tr class hoverTransparente		
	//var lastRow=jQuery('table[id="'+tableid+'"] > tbody > tr:last');	
	var lastRow=jQuery('table#'+tableid+' tbody tr:last');

	//make a clone of the row
	var clones = lastRow.clone(true,true); // copy events/children too

	//find all cloned inputs necessary
	var clonedElements=clones.find('input,span,a,select');
	
	//to keep new ids generated for date fields, to be a
	var datefieldsIds = new Array();
	var datefieldIsIndex = 0;
	
	jQuery(clonedElements).each(function(){

		//get current element
		var element=jQuery(this);

		var number=0;
		//check if its a <A ref element
		if(element.is("a")){

			//get method name from onclick a ref
			//e.g.: method('table[2].column','1234')
			var currentOnclickMethod=element.attr('onclick');

			//>method('table[2].column','1234') -> method('table[3].column','1234')
			var newOnclickMethod=incrementIndexValue(currentOnclickMethod);

			//change method in the onclick event
			element.attr('onclick',newOnclickMethod);
			
			//otherwise its a input, span or select element
		}else{
			//e.g.:'table[2].column4'
			var id=element.attr('id');

			//replace id index with incremented value
			var newId=incrementIndexValue(id);

			//change id for new one
			element.attr('id',newId);
			
			if(element.is("input")){
				//clean last value
				element.val("");	
				//change name  
				element.attr('name',newId);	

				//check if it is a date field
				var classat = element.attr('class');
				if (classat == 'date') {
					datefieldsIds[datefieldIsIndex++]=newId;
				};
			}
			//in case it is an optionfield
			if (element.is("select")) {
				element.val("");
				element.attr('name',newId);
			}
			
			if(element.is("span")){
				//clean last text value
				element.text("");
			};
		}

		//global variable to know current number of lines of the table		
		window["indexTable"]=number;
	});

	//append cloned row to table	
	clones.appendTo(table);
	
	//Setup calendar fields
	setupCalendarInDateFields(datefieldsIds);
	
};


//Setup calendar fields
setupCalendarInDateFields = function(dfIds) {
	
	for (var i = 0; i < dfIds.length; i++) {
		Calendar.setup({ inputField : dfIds[i], ifFormat : '%d-%m-%Y', showsTime : 'false'});
	}
}

//regex expression for increment number between square brackets
incrementIndexValue=function(strvalue){

 return	strvalue.replace(/\[(\d+)\]/g, function(match, number) {
	    // `number` refers to the first group (denoted with ())
	    return "[" + (+number + 1) + "]";
	  });
}

enableAllInputFieds=function(id){

	jQuery("#"+id+" input").attr("disabled", false);

};