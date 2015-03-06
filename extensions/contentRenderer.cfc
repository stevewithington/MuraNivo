/**
* 
* This file is part of MuraNivo TM
*
* Copyright 2015 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.cfobject' output=false {
	
	property name='$';

	public any function init(required struct $) {
		set$($);
		return this;
	}

	public any function dspMuraNivo(
		feed=''
		, theme='default'
		, size='large'
		, height='AUTO'
		, width='AUTO'
		, sliderid = '#LCase(Replace(CreateUUID(), '-', '', 'ALL'))#'
		, effect = 'random'
		, showcaption = true
		, pausetime = '3'
		, outputslidelinks = true
	) {
		var local = {};
		local.str = '';
		local.pluginConfig = getPlugin('MuraNivo');

		local.feed = get$().getBean('feed').loadBy(arguments.feed);
		local.iterator = local.feed.getIterator();

		local.imageArgs = {};

		if ( !Len(Trim(arguments.size)) || LCase(arguments.size) == 'custom' ) {
			local.imageArgs.width = Val(arguments.width);
			local.imageArgs.height = Val(arguments.height);
		} else {
			local.imageArgs.size = arguments.size;
		};

		get$().loadJSLib(); // make sure jQuery is loaded
		local.pluginConfig.addToHTMLHeadQueue('extensions/scripts/scriptsHead.cfm');

		savecontent variable='local.str' {
			include 'includes/muraNivo.cfm';
		};
		
		return local.str;
	}

	public struct function getProperties() {
		var local = {};
		local.properties = {};
		local.data = getMetaData(this).properties;
		for ( local.i=1; local.i <= ArrayLen(local.data); local.i++ ) {
			local.properties[local.data[local.i].name] = Evaluate('get#local.data[local.i].name#()');
		};
		return local.properties;
	}

}