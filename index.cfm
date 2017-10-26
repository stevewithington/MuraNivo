<cfscript>
/**
*
* This file is part of MuraNivo
*
* Copyright 2015-2017 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
	param name='objectparams.feed' default='';
	param name='objectparams.theme' default='default';
	param name='objectparams.size' default='large';
	param name='objectparams.height' default='AUTO';
	param name='objectparams.width' default='AUTO';
	param name='objectparams.sliderid' default=LCase(Replace(CreateUUID(), '-', '', 'ALL'));
	param name='objectparams.effect' default='random';
	param name='objectparams.showcaption' default=true;
	param name='objectparams.pausetime' default=3;
	param name='objectparams.outputslidelinks' default=true;

	local.modulepath = RemoveChars(GetDirectoryFromPath(GetCurrentTemplatePath()), 1, Len(m.globalConfig('webroot')));
	local.feed = m.getBean('feed').loadby(objectparams.feed);
	local.iterator = local.feed.getIterator();

	local.imageArgs = {};
	if ( !Len(Trim(objectparams.size)) || LCase(objectparams.size) == 'custom' ) {
		local.imageArgs.width = Val(objectparams.width);
		local.imageArgs.height = Val(objectparams.height);
	} else {
		local.imageArgs.size = objectparams.size;
	};
</cfscript>
<cfoutput>
	<cfif local.feed.getIsNew()>
			<div class="alert alert-info"><strong>Ooops!</strong> The Content Collection originally used for this slider has been deleted or doesn't exist!</div>
	<cfelseif !local.iterator.hasNext()>
			<div class="alert alert-info"><strong>Ooops!</strong> The Content Collection used for this slider has no images!</div>
	<cfelse>
		<div id="#objectparams.sliderid#-wrapper" class="row-fluid">
			<div class="span12">
				<div class="slider-wrapper theme-#objectparams.theme#">
					<div id="#objectparams.sliderid#" class="nivoSlider">
						<cfloop condition="local.iterator.hasNext()">
							<cfset local.item=local.iterator.next()>
							<cfif ListFindNoCase('jpg,jpeg,gif,png', ListLast(local.item.getImageURL(), '.'))>
								<cfif YesNoFormat(objectparams.outputslidelinks)>
									<a href="#local.item.getURL()#">
								</cfif>
									<img src="#local.item.getImageURL(argumentCollection=local.imageArgs)#" alt="#esapiEncode('html_attr', local.item.getTitle())#"<cfif objectparams.showcaption and Len(Trim(local.item.getSummary()))> title="###objectparams.sliderid#-caption-#local.iterator.getRecordIndex()#"</cfif> />
								<cfif YesNoFormat(objectparams.outputslidelinks)>
									</a>
								</cfif>
							</cfif>
						</cfloop>
					</div>
				</div>
				<cfif objectparams.showcaption>
					<cfset local.iterator.reset()>
					<cfloop condition="local.iterator.hasNext()">
						<cfset local.item=local.iterator.next()>
						<cfif ListFindNoCase('jpg,jpeg,gif,png', ListLast(local.item.getImageURL(), '.')) and Len(Trim(local.item.getSummary()))>
							<div id="#objectparams.sliderid#-caption-#local.iterator.getRecordIndex()#" class="nivo-html-caption">
								<h4>#esapiEncode('html', local.item.getTitle())#</h4>
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
					.loadcss('#local.modulepath#assets/nivo-slider/nivo-slider.css')
					.loadcss('#local.modulepath#assets/nivo-slider/themes/#objectparams.theme#/#objectparams.theme#.css')
					.loadjs(
						'#local.modulepath#assets/nivo-slider/jquery.nivo.slider.pack.js',
						function() {
							jQuery(document).ready(function($) {
								$('###objectparams.sliderid#').nivoSlider({
									effect: '#objectparams.effect#',
									pauseTime: #Val(objectparams.pausetime) * 1000#
								});
							});

						}
					);
			});
		</script>
	</cfif>
</cfoutput>
