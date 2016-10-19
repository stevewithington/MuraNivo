<cfscript>
/**
*
* This file is part of MuraNivo TM
*
* Copyright 2015-2016 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
	params = {};
	if ( IsJSON($.event('params')) ) {
		params = DeSerializeJSON($.event('params'));
	} else if ( IsStruct($.event('params')) ) {
		params = $.event('params');
	}
	defaultParams = { theme = 'default' };
	StructAppend(params, defaultParams, false);

	pluginpath = m.globalConfig('context') & '/plugins/MuraNivo';
	param name='objectparams.sayhellomessage' default='';
</cfscript>

<cfoutput>
	<div id="#arguments.sliderid#-wrapper" class="row-fluid">
		<div class="span12">
			<div class="slider-wrapper theme-#arguments.theme#">
				<div id="#arguments.sliderid#" class="nivoSlider">
					<cfloop condition="local.iterator.hasNext()">
						<cfset local.item=local.iterator.next()>
						<cfif ListFindNoCase('jpg,jpeg,gif,png', ListLast(local.item.getImageURL(), '.'))>
							<cfif YesNoFormat(arguments.outputslidelinks)>
								<a href="#local.item.getURL()#">
							</cfif>
								<img src="#local.item.getImageURL(argumentCollection=local.imageArgs)#" alt="#HTMLEditFormat(local.item.getTitle())#"<cfif arguments.showcaption and Len(Trim(local.item.getSummary()))> title="###arguments.sliderid#-caption-#local.iterator.getRecordIndex()#"</cfif> />
							<cfif YesNoFormat(arguments.outputslidelinks)>
								</a>
							</cfif>
						</cfif>
					</cfloop>
				</div>
			</div>
			<cfif arguments.showcaption>
				<cfset local.iterator.reset()>
				<cfloop condition="local.iterator.hasNext()">
					<cfset local.item=local.iterator.next()>
					<cfif ListFindNoCase('jpg,jpeg,gif,png', ListLast(local.item.getImageURL(), '.')) and Len(Trim(local.item.getSummary()))>
						<div id="#arguments.sliderid#-caption-#local.iterator.getRecordIndex()#" class="nivo-html-caption">
							<h4>#HTMLEditFormat(local.item.getTitle())#</h4>
							#local.item.getSummary()#
						</div>
					</cfif>
				</cfloop>
			</cfif>
		</div>
	</div>

	<script>
	  Mura(function(m) { 
	    m.loader() 
	      .loadcss('#pluginPath#/assets/nivo-slider/nivo-slider.css') 
				.loadcss('#pluginPath#/assets/nivo-slider/themes/#params.theme#/#params.theme#.css')
	      .loadjs(
	      	'#pluginPath#/assets/nivo-slider/jquery.nivo.slider.pack.js',
	        function() {
	          // Do something with the loaded JS
						jQuery(document).ready(function($) {
							$('###arguments.sliderid#').nivoSlider({
								effect: '#arguments.effect#',
								pauseTime: #Val(arguments.pausetime) * 1000#
							});
						});

	        }
	      ); 
	  });
 </script>
</cfoutput>
