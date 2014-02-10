
	function checkData( f )
		{
		var nc=0;
		var s0;
		var s1;
		var s2;
		var ss0;
		var ss1;
		var ss2;
		var s = f.value;

		for( var i=0; i < s.length; i++ )
		{
			var c = s.charAt(i);

			if ((c != ':' && c!= '.' ) && ( (c < '0' ) || ( c > '9' )) )
				return false;
			if ( c == ':' || c == '.' )
				nc++;
		}
		if ( nc == 0 )
			{
			nc = 1;
			s = s + ":00";
			f.value = s;
			}
		if ( nc > 2 | nc < 1 )
			{
			alert( "Sem separadores de hora");
			return false;
			}
		s0='';
		for( i = 0; i < s.length && s.charAt(i) != ':' && s.charAt(i) != '.'; i++ )
			s0 += s.charAt(i);
		s1='';
		if ( i< s.length )
			i++;
		for( ; i < s.length && s.charAt(i) != ':' && s.charAt(i) != '.'; i++ )
			s1 += s.charAt(i);
		s2='';
		if ( i< s.length )
			i++;
		for( ; i < s.length && s.charAt(i) != ':' && s.charAt(i) != '.'; i++ )
			s2 += s.charAt(i);
		if ( s0 == '' || s1 == '' )
			{
			//alert( "Hora inválida");
			f.value = "";
			return false;
			}
		s0 = 1*s0;
		s1 = 1*s1;
		if ( s0 < 0 || s0 > 23 )
			{
			alert( "Hora inválida");
			f.value = "";
			return false;
			}
		if ( s1 < 0 || s1 > 59 )
			{
			alert( "Minutos inválidos");
			return false;
			}
		if ( s2 != '' )
			{
			s2 = 1*s2;
			if ( s2 < 0 || s2 > 59 )
				{
				alert( "Segundos inválidos");
				return false;
				}
			}
		ss0 = ( s0 < 10 ) ? "0" + s0 : ""+s0;
		ss1 = ( s1 < 10 ) ? "0" + s1 : ""+s1;
		s = ss0 + ":" + ss1;
		if ( s2 != '' )
			{
			ss2 = ( s2 < 10 ) ? "0" + s2 : ""+s2;
			s = s + ":" + ss2;
			}
		f.value = s;
		return true;
		}

	function submit( frm ) {
		setValidations( frm );
		if ( ! verify( frm, 0 ) )
			return;
		frm.submit();
	}

	function setComboCode( cmb, val )
	{
		var i;
		
		for ( i=0; i<cmb.options.length; i++ )
		{
			if ( cmb.options[i].value == val )
			{
				cmb.options.selectedIndex = i;
				break;
			}
		}
	}
	
	function toTwo( s, stuff )
	{
		if ( s.length < 2 )
			s = stuff + s;
		return s;
	}

	function cancelar( frm ) {
		frm.reset();
	}

	function setValidation(item, opt, desc, isNumeric, min1, max1) {
		
		item.numeric = isNumeric; 
		if (isNumeric) { 
			item.min = min1; 
			item.max = max1;
		}
  		item.optional = opt; 
		item.descritivo = desc; 
	}

	function prepareValidations(frm) {
	
		for ( var i = 0; i < frm.length; i++ ) {
			var e = frm.elements[i];
			e.optional = true;
		}
	}

	function ishora( s )
	{
		var nc=0;
		var s0;
		var s1;
		var s2;
		
		for( var i=0; i < s.length; i++ )
		{
			var c = s.charAt(i);

			if ((c != ':') && ( (c < '0' ) || ( c > '9' )) )
				return false;
			if ( c == ':' )
				nc++;
		}
		if ( nc > 2 | nc < 1 )
			return false;
		s0='';
		for( i = 0; i < s.length && s.charAt(i) != ':'; i++ )
			s0 += s.charAt(i);
		s1='';
		if ( i< s.length )
			i++;
		for( ; i < s.length && s.charAt(i) != ':'; i++ )
			s1 += s.charAt(i);
		s2='';
		if ( i< s.length )
			i++;
		for( ; i < s.length && s.charAt(i) != ':'; i++ )
			s2 += s.charAt(i);
		if ( s0 == '' || s1 == '' )
			return false;
		s0 = 1*s0;
		s1 = 1*s1;
		if ( s0 < 0 || s0 > 23 )
			return false;
		if ( s1 < 0 || s1 > 59 )
			return false;
		if ( s2 != '' )
			{
			s2 = 1*s2;
			if ( s2 < 0 || s2 > 59 )
				return false;
			}
		return true;
	}
	
	function isBlank( s )
	{
		if ( s == null )
			return true;
		for( var i=0; i < s.length; i++ )
		{
			var c = s.charAt(i);

			if ((c != ' ') && (c != '\n' ) && ( c != '\t' ) ) return false;
		}
		return true;
	}

	function verify(f)
	{
	var msg = "";
	var empty_fields = "";
	var errors = "";
	var lingua = 0;
	
	for ( var i = 0; i < f.length; i++ )
		{
		var e = f.elements[i];

		if ( ( ( e.type == "text" ) || ( e.type == "textarea" ) || ( e.type == "password" ) ) && !e.optional )
			{
			if ( ( e.value == null ) || ( e.value == "" ) || isBlank( e.value ) )
				{
					empty_fields += "\n        "+ ( e.descritivo != undefined ? e.descritivo : e.name );
					continue;
				}
			}
		if ( (e.numeric || (e.min != null ) || (e.max != null )) && ( (e.value != null && e.value != "" ) || !e.optional ) )
			{
				var v = parseFloat( e.value );
				if ( isNaN(v) ||
					( ( e.min != null ) && ( v < e.min ) ) ||
					( ( e.max != null ) && ( v > e.max ) ) )
					{
						switch( lingua )
						{
							case 0: // Português
								errors += "O campo " + e.descritivo + " deve ser numérico ";
								if( e.min != null )
									errors += " superior ou igual a " + e.min;
								if( (e.min != null) && (e.max != null ))
									errors += " e inferior ou igual a " + e.max;
								else if( e.max != null )
									errors += " inferior ou igual a " + e.max;
								errors += ".\n";
								break;
							case 1:	// Inglês
								errors += "The field " + e.descritivo + " must be numeric ";
								if( e.min != null )
									errors += " superior or equal to " + e.min;
								if( (e.min != null) && (e.max != null ))
									errors += " and inferior or equal to" + e.max;
								else if( e.max != null )
									errors += " inferior or equal to " + e.max;
								errors += ".\n";
								break;
						}
					}
			}
		if ( e.hora  && (e.value != null && e.value != "" ) )
			{
				var v = e.value;
				if ( !ishora( e.value ) )
					if ( lingua == "0" )
						{		 // Português
							errors += "O campo " + e.name + " não é uma hora válida\n";
						}
					if ( lingua == "1" )
						{ // Inglês
						errors += "The field " + e.name + " is not a valid hour\n";
						}
			}
		}
	if ( (!empty_fields) && (!errors) )
		return true;
	msg = "Os dados introduzidos não foram submetidos pela(s) seguinte(s) razão(ões):\n\n";
	if ( empty_fields )
		{
		msg += "Os seguintes campos estão em branco: " + empty_fields + "\n";
		if ( errors )
			msg += "\n";
		}
	msg += errors;
	alert ( msg );
	return false;
	}

	function toDate( s )
	{
		var i;
		var sAno="";
		var sMes="";
		var sDia="";
		var tipo = 0;
		var dt;

		for( i=0; i < s.length; i++ )
		{
			if ( s.charAt( i ) == "-" || s.charAt( i ) == "/" || s.charAt( i ) == "\\" )
				tipo++;
			else
				{
				switch( tipo )
					{
					case 0:
						//sDia += s.charAt( i );
						sAno += s.charAt( i );
						break;
					case 1:
						sMes += s.charAt( i );
						break;
					case 2:
						//sAno += s.charAt( i );
						sDia += s.charAt( i );
						break;
					}
				}
		}
		dt = new Date( 0+sAno, sMes-1, 0+sDia );
		//dt = new Date( 0+sDia, sMes-1, 0+sAno);
		//alert(dt);
		return dt;
	}
	
	function dateDiff( di, df )
	{
		return (df-di)/1000/60/60/24;
	}
	
	function isDigit() 
	{
		return(((event.keyCode>=48) && (event.keyCode<=57)) || event.keyCode==46 );
	}