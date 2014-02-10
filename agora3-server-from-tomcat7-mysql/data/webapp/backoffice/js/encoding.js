// encoding.js
var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + //all caps
"abcdefghijklmnopqrstuvwxyz" + //all lowercase
"0123456789+/="; // all numbers plus +/=

//Heres the encode function
function encode64(inp)
{
	var out = ""; //This is the output
	var chr1, chr2, chr3 = ""; //These are the 3 bytes to be encoded
	var enc1, enc2, enc3, enc4 = ""; //These are the 4 encoded bytes
	var i = 0; //Position counter
	
	do { //Set up the loop here
	chr1 = inp.charCodeAt(i++); //Grab the first byte
	chr2 = inp.charCodeAt(i++); //Grab the second byte
	chr3 = inp.charCodeAt(i++); //Grab the third byte
	
	//Here is the actual base64 encode part.
	//There really is only one way to do it.
	enc1 = chr1 >> 2;
	enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
	enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
	enc4 = chr3 & 63;
	
	if (isNaN(chr2)) {
	enc3 = enc4 = 64;
	} else if (isNaN(chr3)) {
	enc4 = 64;
	}
	
	//Lets spit out the 4 encoded bytes
	out = out + keyStr.charAt(enc1) + keyStr.charAt(enc2) + keyStr.charAt(enc3) +
	keyStr.charAt(enc4);
	
	// OK, now clean out the variables used.
	chr1 = chr2 = chr3 = "";
	enc1 = enc2 = enc3 = enc4 = "";
	
	} while (i < inp.length); //And finish off the loop
	
	//Now return the encoded values.
	return out;
}

//Heres the decode function
function decode64(inp)
{
	var out = ""; //This is the output
	var chr1, chr2, chr3 = ""; //These are the 3 decoded bytes
	var enc1, enc2, enc3, enc4 = ""; //These are the 4 bytes to be decoded
	var i = 0; //Position counter
	
	// remove all characters that are not A-Z, a-z, 0-9, +, /, or =
	var base64test = /[^A-Za-z0-9\+\/\=]/g;
	
	if (base64test.exec(inp)) { //Do some error checking
	alert("There were invalid base64 characters in the input text.\n" +
	"Valid base64 characters are A-Z, a-z, 0-9, ?+?, ?/?, and ?=?\n" +
	"Expect errors in decoding.");
	}
	inp = inp.replace(/[^A-Za-z0-9\+\/\=]/g, "");
	
	do { //Here’s the decode loop.
	
	//Grab 4 bytes of encoded content.
	enc1 = keyStr.indexOf(inp.charAt(i++));
	enc2 = keyStr.indexOf(inp.charAt(i++));
	enc3 = keyStr.indexOf(inp.charAt(i++));
	enc4 = keyStr.indexOf(inp.charAt(i++));
	
	//Heres the decode part. There’s really only one way to do it.
	chr1 = (enc1 << 2) | (enc2 >> 4);
	chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
	chr3 = ((enc3 & 3) << 6) | enc4;
	
	//Start to output decoded content
	out = out + String.fromCharCode(chr1);
	
	if (enc3 != 64) {
	out = out + String.fromCharCode(chr2);
	}
	if (enc4 != 64) {
	out = out + String.fromCharCode(chr3);
	}
	
	//now clean out the variables used
	chr1 = chr2 = chr3 = "";
	enc1 = enc2 = enc3 = enc4 = "";
	
	} while (i < inp.length); //finish off the loop
	
	//Now return the decoded values.
	return out;
}
