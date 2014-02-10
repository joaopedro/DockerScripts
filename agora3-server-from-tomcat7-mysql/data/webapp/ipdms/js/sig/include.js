function include_css(url, callback) {
	var css;
    var html_doc = document.getElementsByTagName('head')[0];
    css = document.createElement('link');
    css.setAttribute('rel', 'stylesheet');
    css.setAttribute('type', 'text/css');
    css.setAttribute('href', url);
    html_doc.appendChild(css);
    
	css.onreadystatechange = function () {
		if (css.readyState == 'complete' || css.readyState == 'loaded') {
            callback ? callback() : '';
        }
    }

    css.onload = function () {
        callback ? callback() : '';
    }
	
    return false;
}

function include_js(url, callback) {
	var js;
    var html_doc = document.getElementsByTagName('head')[0];
    js = document.createElement('script');
    js.setAttribute('type', 'text/javascript');
    js.setAttribute('src', url);
    html_doc.appendChild(js);
    
	js.onreadystatechange = function () {
		if (js.readyState == 'complete' || js.readyState == 'loaded') {
            callback();
        }
    }

    js.onload = function () {
        callback();
    }
	
    return false;
}

