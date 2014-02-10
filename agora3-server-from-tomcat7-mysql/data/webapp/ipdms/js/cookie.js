function getCookieVal (offset) 
   {
   var endstr = document.cookie.indexOf (";", offset);
   if (endstr == -1)
      endstr = document.cookie.length;
   return unescape(document.cookie.substring(offset, endstr));
   }

function GetCookie (name) 
   {
   var arg = name + "=";
   var alen = arg.length;
   var clen = document.cookie.length;
   var i = 0;
   while (i < clen) 
      {
      var j = i + alen;
      if (document.cookie.substring(i, j) == arg)
         return getCookieVal (j);
      i = document.cookie.indexOf(" ", i) + 1;
      if (i == 0) break; 
      }
   return null;
   }

function SetCookie (name, value) 
   {
   var argv = SetCookie.arguments;
   var argc = SetCookie.arguments.length;
   var expires = (argc > 2) ? argv[2] : null;
   var path = (argc > 3) ? argv[3] : null;
   var domain = (argc > 4) ? argv[4] : null;
   var secure = (argc > 5) ? argv[5] : false;
   document.cookie = name + "=" + escape (value) +
        ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
        ((path == null) ? "" : ("; path=" + path)) +
        ((domain == null) ? "" : ("; domain=" + domain)) +
        ((secure == true) ? "; secure" : "");
   }

function DeleteCookie () 
   {
   var exp = new Date();
   exp.setTime (exp.getTime() - 1000000000);  // This cookie is history (changed -1 to make it previous time)
   var cval = GetCookie ('DemoName');
   document.cookie ='DemoName' + "=" + cval + "; expires=" + exp.toGMTString();
   alert("The cookie has been deleted.");
   }
//Deactivate Cloaking-->
// Can be used to display name on loading of page.
// Requires onLoad in BODY statement
//function DisplayNameOnStartUp()
//   {
//   if(GetCookie('DemoName') != null)
//      {
//      alert("Welcome back "+GetCookie('DemoName'));
//      }
//   }

// Alert box for Test Cookie
function DisplayName()
   {
   if(GetCookie('DemoName') != null)
      alert("Welcome back "+GetCookie('DemoName'));
   else
      alert("You must set the cookie first.");
   }

// Clears text box after setting cookie
function SetTheCookie()
   {
   if(document.forms[0].elements[0].value.length != 0)  
      {
      var expdate = new Date (); 
      expdate.setTime(expdate.getTime() + (24 * 60 * 60 * 1000 * 365)); 
      SetCookie('DemoName', document.forms[0].elements[0].value, expdate);  
	      alert('Cookie has been set to ' + document.forms[0].elements[0].value + '.');
      document.forms[0].elements[0].value = " ";      
      return false;
      } 
   else 
      {
      alert('You must sign-in first.');
      return false;
      }
   }

   