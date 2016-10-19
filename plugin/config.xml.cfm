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
</cfscript>
<cfoutput>
	<plugin>
		<name>MuraNivo</name>
		<package>MuraNivo</package>
		<directoryFormat>packageOnly</directoryFormat>
		<loadPriority>5</loadPriority>
		<version>2.0.0</version>
		<provider>Steve Withington</provider>
		<providerURL>http://stephenwithington.com</providerURL>
		<category>Application</category>
		<autoDeploy>false</autoDeploy>
		<eventHandlers>
			<eventHandler event="onApplicationLoad" component="model.handlers.muranivo" persist="false" />
		</eventHandlers>
		<settings></settings>
	</plugin>
</cfoutput>
