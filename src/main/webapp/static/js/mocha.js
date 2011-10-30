/* disregard this, just some routine stuff used on Dragon Labs and thus the demo and manual pages. */

$(function() {
	
	$('body').addClass('mocha');

	if ($.browser.msie) $('body').addClass('ie');
	
	if ($.browser.safari) $('body').addClass('safari');
	
	if ($.browser.firefox) $('body').addClass('gecko');
	if ($.browser.camino) $('body').addClass('gecko');
	if ($.browser.mozilla) $('body').addClass('gecko');
	if ($.browser.flock) $('body').addClass('gecko');
	if ($.browser.netscape) $('body').addClass('gecko');
	
});