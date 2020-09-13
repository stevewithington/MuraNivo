# MuraNivo

MuraNivo is a custom [Mura Display Object](https://docs.getmura.com/v7-1/content-managers/structure/#section-inline-edit-display-objects) which utilizes [Nivo Slider](https://github.com/Codeinwp/Nivo-Slider-jQuery) to create configurable slide show display objects. If you're looking for the Mura `plugin` version of this project, visit the ["plugin" branch](https://github.com/stevewithington/MuraNivo/tree/plugin). However, going forward, you should use this `Display Object` version instead.

**NOTE:** *The Nivo Slider version (v3.2) used in this project is licensed under [MIT](http://www.opensource.org/licenses/mit-license.php). However, the [latest version of Nivo Slider](https://themeisle.com/plugins/nivo-slider) is not.*

## How To

Before using this plugin:

* Create a [Local Index](https://docs.getmura.com/v7-1/content-managers/advanced-content/#section-local-indexes). *Local Indexes are also commonly referred to as **Content Collections***.
* The **Local Index** should contain [Content](https://docs.getmura.com/v7-1/content-managers/basic-content/) items with an [Associated Image](https://docs.getmura.com/v7-1/content-managers/basic-content/#section-basic-tab) assigned to each of them.
  * **NOTE**: *Any Content items within the **Local Index** that does not have an **Associated Image** assigned to it **will not appear** in the slider output.*

Once a [Local Index](https://docs.getmura.com/v7-1/content-managers/advanced-content/#section-local-indexes) has been created which contains one or more Content items with an **Associated Image**, follow the remaining steps below.

`@TODO:` *Create detailed instructions*

## Responsive-ness

*Just so you know* ... Nivo Slider is a responsive slider, and as such, the slider will automatically attempt to fill the entire width of its outer container. So if you select `small` for the image size and assign it to the **Main Content** region of a `one_column.cfm` layout template, due to the *responsive-ness* going on, scaling of the image will occur. You may want to either use `custom` and enter your desired `height` and `width`, *or* create a `Custom Image` size by going to **Site Config** > **Edit Site**, then selecting the **Images** tab. See <https://docs.getmura.com/v7-1/theme-developers/customizing-default-output/#section-image-sizes> for more information.

## Tested With

* [Mura CMS](http://www.getmura.com) Core Version 7.1+
* [Lucee](http://lucee.org) 5.2.3.35

## License

Copyright 2015-2020 Stephen J. Withington, Jr.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
