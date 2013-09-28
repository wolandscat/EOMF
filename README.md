## Eiffel Object Modelling Framework (EOMF)

EOMF is a holding project for various generic facilities for Eiffel applications, including:

* [BMM - Basic Meta-Model](library/bmm) - an object schema representation facility. BMM schemas represent object data models, including classes and attributes with open and closed generics, inheritance etc. BMM files are written in ODIN syntax. [Examples](https://github.com/openEHR/reference-models/tree/master/models/openEHR/Release-1.0.2/BMM) used on openEHR.

* [App config file](library/app_resources), in ODIN format.

* [ODIN](library/odin) - Object Data Instance Notation - [parser](parsers/odin), validator, internal Data Tree representation, and serialiser for [ODIN notation](https://github.com/openEHR/odin). 

* [App resources](library/app_resources) - inheritable classes containing useful resources, like access to inline icons, standard app paths, etc.

* [EVX](library/gui/evx) - layer over Eiffel Vision EV lib to provide higher level controls with built-in agents, visual settings.

* [ISO 8601 date/time library](library/app_support/date_time).

* [Error reporting objects](library/app_support/app_framework/error_reporting)

* [Message DB](apps/msg_code_gen) - Multi-lingual error message / UI text database facility; [example message sources and compiled output] (resources/messages).

* [Icon DB](apps/icon_code_gen) - convert a directory of .ico / .png files to inline code for fast loading and fewer files for distribution; [example icon files and compiled output] (resources/icons).

Preferably, some of the App support and other minor classes would be replaced by either ISE Eiffel classes, gobo classes, or EiffelHub classes. These include:

* [EV_GRID enhancements](library/gui/vision2) that add keyboard and mouse support to EV_GRID, as well as cell-editing.

* A [FILE_REPOSITORY](library/app_support/file_system/file_repository.e) class that matches files on a file system.

* The [INTERVAL](library/app_support/basic/interval.e) class and the associated converter class [TYPE_UTILITIES](library/app_support/utility/misc/type_utilities.e).

* The [STRING_UTILITIES](library/app_support/utility/formatting/string_utilities.e) class. This provides routines to: indent text; add line numbers to text; do utf8 / 32 conversions; validate a regex string; generate a soundex translation of a string.

* The [Error reporting](library/app_support/app_framework/error_reporting) classes.

* The [App Event Logging](library/app_support/app_framework/event_log) classes.

* The [SHARED_RESOURCES](library/app_support/app_framework/basic/shared_resources.e) class.

* [The Method dispatcher classes](library/app_support/method_dispatch).

* The mstg_code_gen and icon_code_gen tools above should be built into Eiffel Studio.

* The [vendor fixes](library/vendor-fixes/eiffel_software).

