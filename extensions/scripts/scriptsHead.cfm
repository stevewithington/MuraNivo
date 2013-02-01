<cfsilent><cfscript>
/**
* 
* This file is part of MuraNivo TM
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
	params = {};
	if ( IsJSON($.event('params')) ) { 
		params = DeSerializeJSON($.event('params')); 
	};
	defaultParams = { theme = 'default' };	
	StructAppend(params, defaultParams, false);
</cfscript></cfsilent>
<cfoutput>
    <link rel="stylesheet" href="#$.event('pluginPath')#assets/nivo-slider/themes/#params.theme#/#params.theme#.css" type="text/css" media="screen" />
	<link href="#$.event('pluginPath')#assets/nivo-slider/nivo-slider.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="#$.event('pluginPath')#assets/nivo-slider/jquery.nivo.slider.pack.js"></script>
	<cfif $.event('debug') eq 1>
		<cfdump var="#deserializeJSON($.event('params'))#" />
	</cfif>
</cfoutput>