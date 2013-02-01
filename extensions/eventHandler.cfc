/**
* 
* This file is part of MuraNivo TM
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.plugin.pluginGenericEventHandler' output=false {

	property name='$' hint='mura scope';

	public any function onApplicationLoad(required struct $) {
		var local = {};
		variables.pluginConfig.addEventHandler(this);
		set$(arguments.$);
	}

	public any function onSiteRequestStart(required struct $) {
		var local = {};
		local.contentRenderer = new contentRenderer(arguments.$);
		arguments.$.setCustomMuraScopeKey('muraNivo', local.contentRenderer);
		set$(arguments.$);
	}

	/* 
	* CONFIGURED DISPLAY OBJECTS
	* --------------------------------------------------------------------- */

	public any function dspConfiguredMuraNivo(required struct $) {
		var local = {};
		set$(arguments.$);

		local.params = arguments.$.event('objectParams');
		
		local.defaultParams = {
			feed = ''
			, theme = 'default'
			, size = 'large'
			, width = 'AUTO'
			, height = 'AUTO'
			, sliderid = LCase(Replace(CreateUUID(), '-', '', 'ALL'))
			, effect = 'random'
			, showcaption = true
		};

		StructAppend(local.params, local.defaultParams, false);

		local.str = arguments.$.muraNivo.dspMuraNivo(argumentCollection=local.params);
		return local.str;
	}

}