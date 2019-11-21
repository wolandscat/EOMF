note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-data of a BMM_MODEL"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_MODEL_METADATA

feature -- Definitions

	Default_rm_pubisher: STRING = "Unknown"
	Default_rm_release: STRING = "Unknown"

feature -- Identification

	rm_publisher: STRING
			-- publisher of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_rm_pubisher)
		end

	rm_release: STRING
			-- release of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_rm_release)
		end

end


