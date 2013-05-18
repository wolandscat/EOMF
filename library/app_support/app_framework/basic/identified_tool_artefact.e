note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Defines identification properties for any information artefact handled by a tool, for purposes
				 of indexing in GUI history list, or any other generic situation where artefacts need to be tracked.
				 ]"
	keywords:    "identification"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

deferred class IDENTIFIED_TOOL_ARTEFACT

feature -- Access

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		deferred
		end

	global_artefact_category: STRING
			-- tool-wide category for this artefact, useful for indexing visual type indicators
			-- like pixmap etc
		deferred
		end

end


