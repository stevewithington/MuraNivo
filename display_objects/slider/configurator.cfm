<cfscript>
/**
*
* This file is part of MuraNivo
*
* Copyright 2015-2016 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/

	// Nivo Slider Options: http://nivo.dev7studios.com/support/jquery-plugin-usage/

	$ = application.serviceFactory.getBean('MuraScope').init(session.siteid);

	// need to get a listing of local indexes.
	rsFeeds = $.getBean('feedGateway').getFeeds(siteid=$.event('siteid'),type='Local');

	// Nivo Themes
	arrMuraNivoThemes = ['default','light','dark','bar'];

	// Nivo Transition Effects
	arrMuraNivoEffects = ['sliceDown','sliceDownLeft','sliceUp','sliceUpLeft','sliceUpDown','sliceUpDownLeft','fold','fade','random','slideInRight','slideInLeft','boxRandom','boxRain','boxRainReverse','boxRainGrow','boxRainGrowReverse'];

	// Image Sizes
	arrImageSizes = ['small','medium','large','custom'];

	// IF MuraCMS v6.0+, there may be one or more custom predefined image sizes available
	if ( ListFirst($.globalConfig('version'), '.') >= 6 ) {
		rsImageSizes = $.siteConfig().getCustomImageSizeQuery();
		arrCustomImageSizes = ListToArray(ValueList(rsImageSizes.name));
		arrImageSizes.addAll(arrCustomImageSizes);
	}

	params = {};
	if ( IsJSON($.event('params')) ) {
		params = DeSerializeJSON($.event('params'));
	}

	defaultParams = {
		feed = ''
		, theme = 'default'
		, size = 'large'
		, width = 'AUTO'
		, height = 'AUTO'
		, sliderid = LCase(Replace(CreateUUID(), '-', '', 'ALL'))
		, effect = 'random'
		, showcaption = true
		, pausetime = 3
		, outputslidelinks = true
	};

	StructAppend(params, defaultParams, false);
</cfscript>
<style type="text/css">
	#availableObjectParams dt { padding-top:1.5em; }
	#availableObjectParams dt.first { padding-top:0; }
</style>
<script>
	jQuery('#size').change(function(){
		var o = jQuery('#customOptions');
		if ( this.value == 'custom' ) {
			o.fadeIn('slow');
		} else {
			o.hide().find(':input').val('AUTO');
		}
	});
</script>
<cfoutput>
	<div id="availableObjectParams"
		data-object="plugin"
		data-name="MuraNivo"
		data-objectid="#$.event('objectID')#">
		<dl class="singleColumn">
			<!--- NIVO THEME --->
			<dt class="first"><label for="size">Nivo Theme</label></dt>
			<dd>
				<select name="theme" id="theme" class="objectParam">
					<cfloop array="#arrMuraNivoThemes#" index="theme">
						<option value="#LCase(theme)#"<cfif params.theme eq theme> selected="selected"</cfif>>#esapiEncode('html', theme)#</option>
					</cfloop>
				</select>
			</dd>
			<!--- FEED --->
			<dt><label for="feed">Local Content Index</label></dt>
			<dd>
				<cfif rsFeeds.recordcount>
					<select name="feed" id="feed" class="objectParam">
						<cfif not Len(Trim(params.feed))>
							<option value=""> &ndash; Select &ndash; </option>
						</cfif>
						<cfloop query="rsFeeds">
							<option value="#feedid#"<cfif params.feed eq feedid> selected="selected"</cfif>>#esapiEncode('html', name)#</option>
						</cfloop>
					</select>
				<cfelse>
					<p class="alert alert-info">
						<strong>Ooops!</strong> You need to create a <a href="http://docs.getmura.com/v6/content-managers/building-the-home-page/content-collections/local-content-indexes/">Local Content Index</a> to use this display object. Be sure that your <a href="http://docs.getmura.com/v6/content-managers/building-the-home-page/content-collections/local-content-indexes/">Local Content Index</a> items contain images! For example, create an index of Gallery items.
					</p>
					<input type="hidden" name="feed" value="" />
				</cfif>
			</dd>
			<!--- SLIDER SIZE --->
			<dt><label for="size">Slider Size</label></dt>
			<dd>
				<select name="size" id="size" class="objectParam">
					<cfloop array="#arrImageSizes#" index="image">
						<option value="#LCase(image)#"<cfif params.size eq image> selected="selected"</cfif>>#esapiEncode('html', image)#</option>
					</cfloop>
				</select>
			</dd>
			<!--- SLIDER WIDTH / HEIGHT --->
			<div id="customOptions"<cfif params.size neq 'custom'> style="display:none;"</cfif>>
				<dt><label for="width">Slider Width</label></dt>
				<dd>
					<input type="text"
						name="width" id="width"
						class="objectParam"
						value="#params.width#" />
				</dd>
				<dt><label for="height">Slider Height</label></dt>
				<dd>
					<input type="text"
						name="height" id="height"
						class="objectParam"
						value="#params.height#" />
				</dd>
			</div>
			<!--- SLIDER EFFECT --->
			<dt><label for="size">Transition Effect</label></dt>
			<dd>
				<select name="effect" id="effect" class="objectParam">
					<cfloop array="#arrMuraNivoEffects#" index="e">
						<option value="#e#"<cfif params.effect eq e> selected="selected"</cfif>>#esapiEncode('html', e)#</option>
					</cfloop>
				</select>
			</dd>
			<!--- SLIDER ID --->
			<dt><label for="sliderid">Slider CSS ID</label></dt>
			<dd>
				<input type="text"
					name="sliderid" id="sliderid"
					class="objectParam"
					value="#params.sliderid#" />
			</dd>
			<!--- SHOW CAPTION --->
			<dt><label for="showcaption">Show Caption</label></dt>
			<dd>
				<label class="radio inline">
					<input type="radio" class="objectParam" name="showcaption" value="true" <cfif params.showcaption> checked="checked"</cfif> />
					Yes
				</label>
				<label class="radio inline">
					<input type="radio" class="objectParam" name="showcaption" value="false" <cfif not params.showcaption> checked="checked"</cfif> />
					No
				</label>
			</dd>
			<!--- PAUSE TIME --->
			<dt><label for="size">How long to show each slide (in seconds)</label></dt>
			<dd>
				<select name="pausetime" id="pausetime" class="objectParam">
					<cfloop from="1" to="10" index="s">
						<option value="#s#"<cfif params.pausetime eq s> selected="selected"</cfif>>#esapiEncode('html', s)#</option>
					</cfloop>
				</select>
			</dd>

			<!--- LINK SLIDES --->
			<dt><label for="outputslidelinks">Link Slides</label></dt>
			<dd>
				<label class="radio inline">
					<input type="radio" class="objectParam" name="outputslidelinks" value="true" <cfif params.outputslidelinks> checked="checked"</cfif> />
					Yes
				</label>
				<label class="radio inline">
					<input type="radio" class="objectParam" name="outputslidelinks" value="false" <cfif not params.outputslidelinks> checked="checked"</cfif> />
					No
				</label>
			</dd>
			<!--- MISC. --->
			<input type="hidden" name="configureddts" class="objectParam" value="#now()#" />
			<input type="hidden" name="configuredby" class="objectParam" value="#esapiEncode('html_attr', $.currentUser('LName'))#, #esapiEncode('html_attr', $.currentUser('FName'))#" />
		</dl>
	</div>
</cfoutput>
