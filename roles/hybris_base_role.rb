name "hybris_base_role"
description "this base role sjould applied to all nodes."

# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list( 
  'recipe[hybris_base]'
)

# Attributes applied if the node doesn't have it set already.
#default_attributes()

# Attributes applied no matter what the node has set already.
#override_attributes()
