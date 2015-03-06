<cfscript>
/**
* 
* This file is part of MuraNivo TM
*
* Copyright 2015 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
if ( !IsDefined('$') ) {
	$ = application.serviceFactory.getBean('$');
	if ( StructKeyExists(session, 'siteid') ) {
		$.init(session.siteid);
	} else {
		$.init('default');
	};
};
// restrict to Super Users
if ( !$.currentUser().isSuperUser() ){
	location($.globalConfig('context') & '/admin/', false);
};
</cfscript>
<style type="text/css">
	#bodyWrap h3{padding-top:1em;}
	#bodyWrap ul{padding:0 0.75em;margin:0 0.75em;}
</style>
<cfsavecontent variable="body">
<div id="bodyWrap">
	<h2>MuraNivo&trade;</h2>
	<p>MuraNivo is a Mura CMS plugin that utilizes <a href="http://nivo.dev7studios.com/" target="_blank">Nivo Slider</a> to create configurable slide show display objects.</p>

	<h3>How To</h3>

	<p><strong>NOTE:</strong> Before using this plugin, you will need to create a <a href="http://docs.getmura.com/v6/content-managers/building-the-home-page/content-collections/local-content-indexes/">Local Content Index</a>. Your content collection should contain content items which have Primary Associated Images assigned to them. For example, most 'News' items typically have a Primary Associated Image. You may simply wish to create a content collection of a Mura Gallery, which is perfectly suited for this plugin. Once a <a href="http://docs.getmura.com/v6/content-managers/building-the-home-page/content-collections/local-content-indexes/">Local Content Index</a> has been created, simply follow the remaining steps below.</p>

	<ul>
		<li>From the <strong>Site Manager</strong>, select any content item to edit it (e.g., the 'About Us' page)</li>
		<li>Go to <strong>Layout &amp; Objects</strong> tab</li>
		<li>From the <strong>Available Content Objects</strong> select menu, choose <strong>Plugins</strong></li>
		<li>From the <strong>Select Plugin</strong> select menu, choose <strong>MuraNivo</strong></li>
		<li>In the list of display objects, click <strong>MuraNivo Slider</strong> and assign it to your desired display region</li>
		<li>The <strong>MuraNivo</strong> configurator will open
			<ul>
				<li>Select a <strong>Nivo Theme</strong></li>
				<li>If you have created any Local Content Collections, choose one of them from the <strong>Local Content Index</strong> select menu</li>
				<li>Choose your desired <strong>Slider Size</strong>. If your site has any custom-defined image sizes, the name will appear in the list.</li>
				<li>Select a <strong>Transition Effect</strong></li>
				<li>If you wish to use your own CSS ID, enter that in the <strong>Slider CSS ID</strong> text field. This ID will create a wrapper as: <strong>yourCSSID-wrapper</strong>. In addition, the ID will be used with the slider itself.</li>
				<li>If you wish to display captions, select <strong>Yes</strong> for <strong>Show Caption</strong>. If selected, the content node's Title and Summary will appear in a caption area if any text has been entered in the Summary field.</li>
			</ul>
		</li>
		<li>If you wish to output the links for each slide, select <strong>Yes</strong> for <strong>Link Slides</strong>. If selected, each slide will be wrapped with its URL.</li>
	</ul>

	<!---
	<h3>Developers</h3>
	<p>Technically, you could do something like this as well:</p>
	<pre>[mura]$.muraNivo.dspMuraNivo(feed='Latest News',size='custom',height=100,width=300)[/mura]</pre>
	--->

	<h3>Responsive-ness</h3>
	<div class="alert alert-info">
		<strong>Just so you know &hellip;</strong> Nivo Slider is a responsive slider, and as such, the slider will automatically attempt to fill the entire width of its outer container. So if you select 'small' for the image size and assigned it to the main content area of a one_column.cfm layout template, due to the responsive-ness going on, scaling of the image will occur. You may want to either use <strong>custom</strong> and put your own height and width in, or create a custom image size by going to <strong>Site Config</strong> &gt; <strong>Edit Site</strong>, then selecting the <strong>Images</strong> tab.
	</div>
	
	<h3>Tested With</h3>
	<ul>
		<li>Mura CMS Core Version <strong>6.2+</strong></li>
		<li>Adobe ColdFusion <strong>11.0.3</strong></li>
		<li>Lucee <strong>4.5.1.000</strong></li>
	</ul>

	<h3>Need help?</h3>
	<p>If you're running into an issue, please let me know at <a href="https://github.com/stevewithington/MuraNivo/issues">https://github.com/stevewithington/MuraNivo/issues</a> and I'll try to address it as soon as I can.</p>
	
	<p>Cheers!<br />
	<a href="http://stephenwithington.com">Steve Withington</a></p>
	
</div>
</cfsavecontent>
<cfoutput>
	#$.getBean('pluginManager').renderAdminTemplate(
		body = body
		, pageTitle = ''
		, jsLib = 'jquery'
		, jsLibLoaded = false
	)#
</cfoutput>