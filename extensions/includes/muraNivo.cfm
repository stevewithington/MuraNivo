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
</cfscript></cfsilent>
<cfoutput>
	<div id="#arguments.sliderid#-wrapper" class="row-fluid">
		<div class="span12">
			<div class="slider-wrapper theme-#arguments.theme#">
				<div id="#arguments.sliderid#" class="nivoSlider">
					<cfloop condition="local.iterator.hasNext()">
						<cfset local.item=local.iterator.next()>
						<cfif ListFindNoCase('jpg,jpeg,gif,png', ListLast(local.item.getImageURL(), '.'))>
							<a href="#local.item.getURL()#">
								<img src="#local.item.getImageURL(argumentCollection=local.imageArgs)#" alt="#HTMLEditFormat(local.item.getTitle())#"<cfif arguments.showcaption and Len(Trim(local.item.getSummary()))> title="###arguments.sliderid#-caption-#local.iterator.getRecordIndex()#"</cfif> />
							</a>
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
		jQuery(document).ready(function($) {
			$('###arguments.sliderid#').nivoSlider({
				effect: '#arguments.effect#'
			});
		});
	</script>
</cfoutput>
<!--- <cfif $.event('debug') eq 1>
	<cfif IsJSON($.event('params'))>
		<cfdump var="#DeSerializeJSON($.event('params'))#">
	<cfelse>
		<cfdump var="#$.event('params')#">
	</cfif>
</cfif> --->