note
	component:   "Eiffel Object Modelling Framework"
	description: "Serialiser Manager for all DT serialiser types"
	keywords:    "Data Tree"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_VISITOR_ITERATOR

create
	make

feature -- Initialisation

	make(a_target: DT_COMPLEX_OBJECT; a_visitor: DT_VISITOR)
			-- create a new iterator targetted to the DT tree `a_target'
		require
			Target_exists: a_target /= Void
			Visitor_exists: a_visitor /= Void
		do
			create tree_iterator.make (a_target.representation)
			visitor := a_visitor
		end

feature -- Command

	do_all
			-- start the serialisation process; the result will be in `serialiser_output'
		do
			tree_iterator.do_all (agent node_enter_action (?,?), agent node_exit_action (?,?))
		end

feature {NONE} -- Implementation

	tree_iterator: OG_ITERATOR

	visitor: DT_VISITOR

	node_enter_action (a_node: attached OG_ITEM; indent_level: INTEGER)
		do
			a_node.enter_subtree (visitor, indent_level)
		end

	node_exit_action (a_node: attached OG_ITEM; indent_level: INTEGER)
		do
			a_node.exit_subtree (visitor, indent_level)
		end

end


