note
	component:   "Eiffel Object Modelling Framework"
	description: "descriptor for conversion for one type into and out of DT_OBJECT"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_CONV_DESC

create
	make

feature -- Initialisation

	make (a_from_obj_proc: like from_obj_proc; a_from_dt_proc: like from_dt_proc)
		require
			From_proc_valid: a_from_obj_proc /= Void
			To_proc_valid: a_from_dt_proc /= Void
		do
			from_obj_proc := a_from_obj_proc
			from_dt_proc := a_from_dt_proc
		end


feature -- Access

	from_obj_proc: PROCEDURE [DT_OBJECT_CONVERTER, TUPLE [DT_ATTRIBUTE_NODE, ANY, STRING]]
			-- object_to_dt(a_parent: DT_ATTRIBUTE_NODE; an_obj: ANY; a_node_id: STRING)

	from_dt_proc: PROCEDURE [DT_OBJECT_CONVERTER, TUPLE [INTEGER, ANY, ANY]]
			-- signature: from_dt_xxx (a_dt_obj: DT_OBJECT_ITEM)
			-- set_xxx_field (i: INTEGER; object: ANY; value: ANY)

end


