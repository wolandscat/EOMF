note
	component:   "Eiffel Object Modelling Framework"
	description: "Tree iterator for OG structures that deploys a visitor on the OG node content property."
	keywords:    "archetype, constraint, definition"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_CONTENT_ITERATOR

create
	make

feature -- Initialisation

	make (a_target: OG_OBJECT_NODE; a_visitor: ANY)
			-- create a new manager targetted to the parse tree `a_target'
		do
			create tree_iterator.make (a_target)
			visitor := a_visitor
		end

feature -- Command

	do_all
			-- do all nodes in tree
		do
			tree_iterator.do_all (agent node_enter_action, agent node_exit_action)
		end

	do_until_surface_plus_one (is_included_agt: FUNCTION [ANY, TUPLE [OG_NODE], BOOLEAN]; dont_test_root: BOOLEAN)
			-- do nodes for which is_included_agt returns True and then one more
		do
			tree_iterator.do_until_surface_plus_one (agent node_enter_action, agent node_exit_action, is_included_agt, dont_test_root)
		end

feature {NONE} -- Implementation

	tree_iterator: OG_ITERATOR

	visitor: ANY

	node_enter_action (a_node: OG_ITEM; indent_level: INTEGER)
		do
			a_node.enter_subtree (visitor, indent_level)
		end

	node_exit_action (a_node: OG_ITEM; indent_level: INTEGER)
		do
			a_node.exit_subtree (visitor, indent_level)
		end

end


