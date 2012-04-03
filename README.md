FacebookShareCount for Movable Type
====================================
This is a plugin for the Movable Type CMS (http://www.movabletype.org).  It pulls in the number of Facebook likes/shares for all entries in a blog periodically, and makes this data available for display and/or sorting, both in the backend and on the frontent of the blog.

Compatibility
-------------
This plugin has been developed on Movable Type 5.13, but earlier versions of MT5.x should work.  It hasn't been tested on Movable Type 4.x, but it should work except for the parts that use the listing framework in the backend.

Requirements
-------------
This plugin uses a scheduled task to pull in the data from Facebook every hour, so either the tools/run-periodic-tasks on the server needs to be run regularily or the RSS feed of the system activity log needs to be fetched periodically (this also triggers the scheduled tasks framework in Movable Type).

Installation
-------------
Simply copy the FacebookShareCount folder into the 'plugins' folder of your Movable Type installation.

Configuration
--------------
Go to the Tools > Plugins menu of the blog you want to enable this plugin for, and open the settings for the FacebookShareCount plugin.  Check the box to enable the plugin, and save the settings.

Usage
------
* In Movable Type 5, go to the screen listing a blog's entries and click on the 'Display Options'.  There should now be an option to add a 'Facebook Shares' column to the listing.  NOTE: the data is refreshed hourly, so right after plugin installation the column might still be blank.  Also, if none of your posts are shared on Facebook, the column will remain blank as well.
* The plugin adds a tag <mt:EntryFBShares> to any entry context in MT's templates, which will display the current number of Facebook shares at the time the template was published.
* The plugin adds a 'fbshares' field to the standard MT::Entry object, allowing entries lists to be sorted by this number in this way:


    <mt:entries lastn="99999" sort_by="fbshares" sort_order="desc">
    <li><mt:EntryFBShares> - <a href="<mt:entrypermalink>"><mt:entrytitle></a></li>
    </mt:entries>
    

Credits
-------
This plugin was written by Maarten Schenk (maarten@yesitcan.be) of http://www.yesitcan.be and http://www.movabletips.com in 2012.
You are free to use this plugin on your Movable Type installation for any purpose provided you leave this message intact.

