/*
Cross-browser prompt class.
Copyright 2007 Craig Manley.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

/*
$Id: Prompt.js,v 1.5 2007/03/22 17:11:46 cmanley Exp $

In yet another sly move by Micro$oft, MSIE 7 has been designed to suppress the javascript
prompt function, yet at the same time always allow their MSIE-specific showModalDialog method.
This has broken millions of web sites. The work-arounds to this problem are any of these:
 1. Use the showModalDialog method instead and thereby only support MSIE browsers (they wish).
 2. Do away with using prompt dialogs completely.
 3. Use simulated modal dialogs with layer's and key capturing (complicated and messy).
 4. Use this class to simulate the javascript prompt function by using showModalDialog for MSIE 7 and up.

Usage:
1. Place the files Prompt.js, Prompt.html, and Prompt.png together into any directory in your site.
   Do not rename any of the files or else it won't work.
2. Place this line in the head section of your html:
   <script type="text/javascript" src="/path/to/Prompt.js"></script>
3. Call the Prompt.show method where you would normally call the javascript prompt function:
   var name  = Prompt.show('Who are you?');
   var sides = Prompt.show("How many sides does a square have?", 4, 'Silly question dialog');
   var count = Prompt.show("How many\nlines\ndo\n\n\nyou see\nhere?", '', 'Answer this');
*/


function Prompt() {

	/*** Private properties ***/
	var _msie = (navigator.appVersion.indexOf('MSIE') != -1) && (navigator.userAgent.indexOf('Opera') == -1);
	var _simulate = navigator.appVersion.match(/\bMSIE (\d+)/) && (RegExp.$1 >= 7) && window.showModalDialog;
	var _script_uri_path = (
		function(basename) {
			var tags = document.getElementsByTagName('script');
			var result = '';
			for (var i=0; i < tags.length; i++) {
				var src = tags[i].getAttribute('src');
				if (!src) {
					continue;
				}
				var x = src.lastIndexOf('/');
				if (x == src.length - 1) {
					continue;
				}
				if (basename != (x == -1 ? src : src.substr(x + 1))) {
					continue;
				}
				// found
				result = (x == -1) ? src : src.substr(0,x + 1);
				break;
			}
			return result;
		})('Prompt.js');


	/*** Private methods ***/

	// Returns the estimated dimensions of the given string when rendered as text (not html).
	// Functionally similar to the Windows API function GetTextExtent(h,txt).
	// 'opts' is an optional object in which you may pass styles such as 'fontFamily' or 'fontSize'.
	// EXPERIMENTAL:
	//   Requires more testing.
	//   Perhaps the 1st argument should be a DOM element to be cloned instead of using opts.
	var _getTextExtent = function(txt, opts) {
		var div = document.createElement('div');
		if (opts) {
			if (opts['fontFamily']) {
				div.style.fontFamily = 'font-family: ' + opts['fontFamily'];
			}
			if (opts['fontSize']) {
				div.style.fontSize = opts['fontSize'];
			}
		}
		div.style.position = 'absolute';
		div.style.top = 0;
		div.style.left = 0;
		div.style.whiteSpace = 'nowrap';
		div.style.overflow = 'hidden';
		div.zIndex = 6322;
		var lines;
		// MSIE bug (tested with MSIE 7) String.split() doesn't keep empty matches, so this hack is required:
		if (_msie) {
			lines = [];
			while (txt.length && txt.match(/^([^\r\n]*)(\r\n|\n\r|\r|\n)?/)) {
				lines.push(RegExp.$1);
				txt = txt.substr(RegExp.$2 ? RegExp.$1.length + RegExp.$2.length : RegExp.$1.length);
			}
		}
		else {
			lines = txt.split(/\r\n|\n\r|\r|\n/);
		}
		for (var i = 0; i < lines.length; i++) {
			div.appendChild(document.createTextNode(lines[i] == ' ' ? '' : lines[i]));
			if (i < lines.length - 1) {
				div.appendChild(document.createElement('br'));
			}
		}
		div.style.visibility = 'hidden';
		//div.style.backgroundColor = 'green';
		var container = document.body;
		if (container.firstChild) {
			container.insertBefore(div, container.firstChild);
		}
		else {
			container.appendChild(div);
		}
		var dims = [div.offsetWidth, div.offsetHeight];
		container.removeChild(div);
		div = null;
		return dims;
	};


	/*** Public methods ***/
	// Either calls or simulates the javascript prompt function.
	// The first 2 arguments are the same as for the javascript prompt function.
	// An optional 3rd argument can be passed which is the caption to be used
	// in the title bar, but this only applies to MSIE 7+.
	this.show = function(msg) {
		var argv = arguments;
		if (msg && (typeof(msg) == 'string')) {
			msg = msg.replace(/^\s+|\s+$/g,'');
		}
		var input = argv.length <= 1 ? '' : argv[1];
		var caption = argv.length <= 2 ? '' : argv[2];
		var result;
		if (_simulate) {
			var dims = _getTextExtent(msg, {fontFamily: 'Arial, sans-serif', fontSize: '10pt'});
			var w = dims[0] + 60;
			if (w < 250) {
				w = 250;
			}
			var h = dims[1] + 115;
			result = window.showModalDialog(
				_script_uri_path + 'Prompt.html',
				{ msg: msg, input: input, caption: caption },
				'dialogWidth: ' + w + 'px; dialogHeight: ' + h + 'px' + 'status: off');
		}
		else {
			result = prompt(msg, input);
		}
		return result;
	};
}
Prompt.show = function(msg) {
	var argv = arguments;
	var input = argv.length <= 1 ? '' : argv[1];
	var caption = argv.length <= 2 ? '' : argv[2];
	var p = new Prompt();
	return p.show(msg, input, caption);
};
