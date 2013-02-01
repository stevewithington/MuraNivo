/**
* 
* This file is part of MuraNivo TM
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
function init(data) {

	initConfigurator(data,{
		url: '../plugins/MuraNivo/extensions/configurators/muraNivo/configurator.cfm'
		, pars: ''
		, title: 'MuraNivo'
		, init: function(){}
		, destroy: function(){}
		, validate: function(){
			// if ( jQuery('#width').val() != 900 ) {
			// 	var response = confirm('Dude...seriously?');
			// 	if ( !response ) return false;
			// };
			return true;
		}
	});

	return true;

};