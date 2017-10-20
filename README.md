# MuraNivo

MuraNivo is a Mura CMS Display Object (or "Module" in v7.1+) that utilizes [Nivo Slider](http://nivo.dev7studios.com/) to create configurable slide show display objects. If you're looking for the Mura CMS "plugin" version of this project, visit the ["plugin" branch](https://github.com/stevewithington/MuraNivo/tree/plugin). However, going forward, you should use this "Display Object" version instead.

**NOTE:** *The Nivo Slider version (v3.2) used in this project is licensed under [MIT](http://www.opensource.org/licenses/mit-license.php). However, the [latest version of Nivo Slider](https://themeisle.com/plugins/nivo-slider) is not.*

## How To

**NOTE:** Before using this plugin, you will need to create a [Local Index](http://docs.getmura.com/v7/content-managers/advanced-content/collections/local-indexes/). Your content collection should contain content items which have Primary Associated Images assigned to them. For example, most 'News' items typically have a Primary Associated Image.

Once a [Local Content Index](http://docs.getmura.com/v7/content-managers/advanced-content/collections/local-indexes/) has been created, simply follow the remaining steps below.

**Detailed instructions coming soon**


## Responsive-ness

**Just so you know** ... Nivo Slider is a responsive slider, and as such, the slider will automatically attempt to fill the entire width of its outer container. So if you select 'small' for the image size and assign it to the main content area of a one_column.cfm layout template, due to the responsive-ness going on, scaling of the image will occur. You may want to either use custom and put your own height and width in, or create a custom image size by going to **Site Config** > **Edit Site**, then selecting the **Images** tab.


## Tested With
* [Mura CMS](http://www.getmura.com) Core Version 7.0+
* [Lucee](http://lucee.org) 5.2.3.35


## License
Copyright 2015-2017 Stephen J. Withington, Jr.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.