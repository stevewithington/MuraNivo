<cfscript>
/**
*
* This file is part of MuraNivo
*
* Copyright 2015-2020 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/

	// Nivo Slider Options: <http://docs.themeisle.com/article/485-getting-started-with-the-nivo-slider-jquery-plugin>

	// Mura Scope
	if ( !IsDefined('m') ) {
		m = StructKeyExists(session, 'siteid')
			? application.serviceFactory.getBean('MuraScope').init(session.siteid)
			: application.serviceFactory.getBean('MuraScope').init('default');
	}

	// need to get a listing of local indexes.
	rsFeeds = m.getBean('feedGateway').getFeeds(siteid=m.event('siteid'),type='Local');

	// Nivo Themes
	arrMuraNivoThemes = ['default','light','dark','bar'];

	// Nivo Transition Effects
	arrMuraNivoEffects = ['sliceDown','sliceDownLeft','sliceUp','sliceUpLeft','sliceUpDown','sliceUpDownLeft','fold','fade','random','slideInRight','slideInLeft','boxRandom','boxRain','boxRainReverse','boxRainGrow','boxRainGrowReverse'];

	// Image Sizes
	arrImageSizes = ['small','medium','large','custom'];
	// get custom image sizes too
	rsImageSizes = m.siteConfig().getCustomImageSizeQuery();
	arrCustomImageSizes = ListToArray(ValueList(rsImageSizes.name));
	arrImageSizes.addAll(arrCustomImageSizes);

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

</cfscript>
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
	<!--- NIVO THEME --->
	<div class="mura-control-group">
		<label class="mura-control-label" for="size">Nivo Theme</label>
		<select name="theme" id="theme" class="objectParam">
			<cfloop array="#arrMuraNivoThemes#" index="theme">
				<option value="#LCase(theme)#"<cfif objectparams.theme eq theme> selected="selected"</cfif>>#EncodeForHTML(theme)#</option>
			</cfloop>
		</select>
	</div>

	<!--- FEED --->
	<div class="mura-control-group">
		<label class="mura-control-label" for="feed">Local Content Index</label>

		<cfif rsFeeds.recordcount>
			<select name="feed" id="feed" class="objectParam">
				<cfif not Len(Trim(objectparams.feed))>
					<option value=""> &ndash; Select &ndash; </option>
				</cfif>
				<cfloop query="rsFeeds">
					<option value="#feedid#"<cfif objectparams.feed eq feedid> selected="selected"</cfif>>#EncodeForHTML(name)#</option>
				</cfloop>
			</select>
		<cfelse>
			<p class="alert alert-info">
				<strong>Ooops!</strong> You need to create a <a href="http://docs.getmura.com/v6/content-managers/building-the-home-page/content-collections/local-content-indexes/">Local Content Index</a> to use this display object. Be sure that your <a href="http://docs.getmura.com/v6/content-managers/building-the-home-page/content-collections/local-content-indexes/">Local Content Index</a> items contain images! For example, create an index of Gallery items.
			</p>
			<input type="hidden" name="feed" value="" />
		</cfif>
	</div>

	<!--- SLIDER SIZE --->
	<div class="mura-control-group">
		<label class="mura-control-label" for="size">Slider Size</label>
		<select name="size" id="size" class="objectParam">
			<cfloop array="#arrImageSizes#" index="image">
				<option value="#LCase(image)#"<cfif objectparams.size eq image> selected="selected"</cfif>>#esapiEncode('html', image)#</option>
			</cfloop>
		</select>
	</div>

	<!--- SLIDER WIDTH / HEIGHT --->
	<div id="customOptions"<cfif objectparams.size neq 'custom'> style="display:none;"</cfif>>
		<div class="mura-control-group">
			<label class="mura-control-label" for="width">Slider Width</label>
			<input type="text"
				name="width" id="width"
				class="objectParam"
				value="#objectparams.width#" />
		</div>
		<div class="mura-control-group">
			<label class="mura-control-label" for="height">Slider Height</label>
			<input type="text"
				name="height" id="height"
				class="objectParam"
				value="#objectparams.height#" />
		</div>
	</div>

	<!--- SLIDER EFFECT --->
	<div class="mura-control-group">
		<label class="mura-control-label" for="size">Transition Effect</label>
		<select name="effect" id="effect" class="objectParam">
			<cfloop array="#arrMuraNivoEffects#" index="e">
				<option value="#e#"<cfif objectparams.effect eq e> selected="selected"</cfif>>#EncodeForHTML(e)#</option>
			</cfloop>
		</select>
	</div>

	<!--- SLIDER ID --->
	<div class="mura-control-group">
		<label class="mura-control-label" for="sliderid">Slider CSS ID</label>
		<input type="text"
			name="sliderid" id="sliderid"
			class="objectParam"
			value="#objectparams.sliderid#" />
	</div>

	<!--- SHOW CAPTION --->
	<div class="mura-control-group">
		<label class="mura-control-label" for="showcaption">Show Caption</label>
		<label class="radio inline">
			<input type="radio" class="objectParam" name="showcaption" value="true" <cfif objectparams.showcaption> checked="checked"</cfif> />
			Yes
		</label>
		<label class="radio inline">
			<input type="radio" class="objectParam" name="showcaption" value="false" <cfif not objectparams.showcaption> checked="checked"</cfif> />
			No
		</label>
	</div>

	<!--- PAUSE TIME --->
	<div class="mura-control-group">
		<label class="mura-control-label" for="size">How long to show each slide (in seconds)</label>
		<select name="pausetime" id="pausetime" class="objectParam">
			<cfloop from="1" to="10" index="s">
				<option value="#s#"<cfif objectparams.pausetime eq s> selected="selected"</cfif>>#EncodeForHTML(s)#</option>
			</cfloop>
		</select>
	</div>

	<!--- LINK SLIDES --->
	<div class="mura-control-group">
		<label class="mura-control-label" for="outputslidelinks">Link Slides</label>
		<label class="radio inline">
			<input type="radio" class="objectParam" name="outputslidelinks" value="true" <cfif objectparams.outputslidelinks> checked="checked"</cfif> />
			Yes
		</label>
		<label class="radio inline">
			<input type="radio" class="objectParam" name="outputslidelinks" value="false" <cfif not objectparams.outputslidelinks> checked="checked"</cfif> />
			No
		</label>
	</div>

	<!--- MISC. --->
	<input type="hidden" name="configureddts" class="objectParam" value="#now()#" />
	<input type="hidden" name="configuredby" class="objectParam" value="#EncodeForHTMLAttribute(m.currentUser('LName'))#, #EncodeForHTMLAttribute(m.currentUser('FName'))#" />
</cfoutput>
