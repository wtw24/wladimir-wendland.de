---
author: "Wladimir Wendland"
date: 2022-10-13
title: How to set visible columns default for the 'Files' file manager?
tags: ["ubuntu", "nautilus", "files"]
---

For Ubuntu 22.04 LTS:

1. Open Terminal with `Ctrl-Alt-T`
2. Install `dconf-tools`:

~~~shell
sudo apt-get install dconf-tools
~~~

3. Open _dconf-editor_ using `dconf-editor` command.

4. Go to `org/gnome/nautilus/list-view/default-visible-columns`. There you can edit the custom value field with the name of the columns you would like to be as the default view for all your folders.


My `Custom value`;
~~~
['name', 'size', 'owner', 'group', 'permissions', 'date_modified', 'starred']
~~~

Names of the columns from the nautalius project:
~~~
['name', 'size', 'type', 'owner', 'group', 'permissions', 'detailed_type', 'where', 'date_modified_with_time', 'date_modified', 'date_accessed', 'date_created', 'recency', 'starred']
~~~
