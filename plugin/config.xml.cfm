<cfscript>
/**
* 
* This file is part of MuraNivo TM
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
</cfscript>
<cfoutput>
<plugin>
	<name>MuraNivo</name>
	<package>MuraNivo</package>
	<directoryFormat>packageOnly</directoryFormat>
	<loadPriority>5</loadPriority>
	<version>0.103</version>
	<provider>Steve Withington</provider>
	<providerURL>http://stephenwithington.com</providerURL>
	<category>Utility</category>
	<ormCFCLocation></ormCFCLocation>
	<customTagPaths></customTagPaths>
	<autoDeploy>false</autoDeploy>
	<settings></settings>
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="extensions.eventHandler" persist="false" />
	</eventHandlers>
	<displayobjects location="global">
		<!--- configurable display object --->
		<displayobject name="MuraNivo Slider"  
			component="extensions.eventHandler"
			displaymethod="dspConfiguredMuraNivo"
			configuratorJS="extensions/configurators/muraNivo/configurator.js"
			configuratorInit="init"
			persist="false" />
	</displayobjects>
	<extensions></extensions>
</plugin>
</cfoutput>