note
	component:   "EOMF library"
	description: "Interface to config file reader/writer class"
	keywords:    "config, file"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

deferred class CONFIG_FILE_ACCESS_I

inherit
	KL_SHARED_FILE_SYSTEM

	SHARED_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

feature -- Definitions

	file_header_text: STRING
		deferred
		end

feature -- Initialisation

	make
		do
			create errors.make
			create file_path.make_empty
		end

feature -- Access

	file_path: STRING
			-- path to resource file

	dt_tree: detachable DT_COMPLEX_OBJECT_NODE
			-- result of parsing

	errors: ERROR_ACCUMULATOR

feature -- Modification

	set_file_path (a_file_path: STRING)
			-- Make with `a_file_path', which doesn't necessarily exist as a file. If it does, it will be read;
			-- if not, nothing will be read, and the first save request will create the file new.
		do
			file_path := a_file_path
		end

feature -- Commands

	load
			-- read content from file and parse to Data Tree form.
			-- if file not readable, or not there, or in wrong syntax, do nothing.
		deferred
		end

	save (a_dt_tree: DT_COMPLEX_OBJECT_NODE)
		deferred
		end

end

--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is config_file_access.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
