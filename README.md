## Eiffel Object Modelling Framework (EOMF)

EOMF is a library project for various generic facilities for Eiffel applications, including:

* [EVX](library/gui/evx) - layer over Eiffel Vision EV lib to provide higher level controls with built-in agents, visual settings.

* [Icon support](library/gui/icons) - small set of classes to support programmatically represented icons, plus [icon_code_gen](apps/icon_code_gen) tool to convert .ico and .png files to Eiffel classes, allowing fast loading and fewer files for distribution; [example icon files and compiled output] (resources/icons).

* [BMM - Basic Meta-Model](library/bmm) - an object schema representation facility. BMM schemas represent object data models, including classes and attributes with open and closed generics, inheritance etc. BMM files are written in ODIN syntax. [Examples](https://github.com/openEHR/reference-models/tree/master/models/openEHR/Release-1.0.2/BMM) used on openEHR.

* [ODIN- Object Data Instance Notation](library/odin) - [parser](parsers/odin), validator, internal Data Tree representation, and serialiser for [ODIN notation](https://github.com/openEHR/odin). 

* [Data Tree](library/data_tree) - intermediate hierarchical tree representation of complex objects, like an XML DOM tree. Enables objects serialised as ODIN and other formats to be parsed to DT form, then converted to real objects.

* [Object Graph](library/object_graph) - library providing generic object/attribute tree structure behind more specific object-based tree concepts like Data Tree. Provides built-in pathing and generic visitor capability.

* [External VCS tools](library/external_tools) - library for interfacing to Git and SVN tools (only Git implemented) via PROCESS classes.

* [App config file](library/app_support/app_resources), library for application configuration file, in ODIN format.

* [Parsing support](library/parsing) - various classes to support doing parsing and serialisation, with error reporting.

* [Message generator](apps/msg_code_gen) - Multi-lingual error message / UI text database facility; [example message sources and compiled output] (library/messages).

* [Basic Messages](library/messages) - core set of useful messages for any application, e.g. to do with file tests, etc.

There are some further classes that idealy would be in a more core libray like ISE or gobo:

* [EV_GRID enhancements](library/gui/vision2) that add keyboard and mouse support to EV_GRID, as well as cell-editing.

* A [FILE_REPOSITORY](library/file_system/file_repository.e) class that matches files on a file system, and [FILE_CONTEXT](library/file_system/file_context.e) class that does things like get first N lines of a file, get first N lines matching a pattern - designed to support fast pre-parsing of numerous files.

* The [INTERVAL](library/basic/data_structures) classes and the associated converter class [TYPE_UTILITIES](library/basic/data_structures/type_utilities.e).

* The [STRING_UTILITIES](library/basic/formatting/string_utilities.e) class. This provides routines to: indent text; add line numbers to text; do utf8 / 32 conversions; validate a regex string; generate a soundex translation of a string.

* The [App Event Logging](library/app_support/event_log) classes.

* The [SHARED_RESOURCES](library/app_support/app_resources/shared_resources.e) class.

* [The Method dispatcher classes](library/app_support/method_dispatch).

* The msg_code_gen and icon_code_gen tools above should be built into Eiffel Studio.

* The [vendor fixes](library/vendor-fixes/eiffel_software).

