# Role that allows a user to manage pages and define what parts are editable, default is :admin
# The namespace that you would like to use for the routes. The default is 'cms'.
# Run rake:routes to see this in action
# @example Setting a custom route namespace

# Regulate.setup do |config|
#   config.route_namespace = 'my_custom_route_namespace'
# end

# AbstractAuth Implementations
# You NEED to set these methods appropriately for Regulate to function
# This method should return the currently authenticated resource if they are authorized to manage the cms
# The following should work with Devise/AuthLogic

AbstractAuth.implement :authenticated_user do
  current_user
end

# This method should return whether the currently authenticated resource is an admin or not
# Admins are able to edit the view field on a CMS page and define the editable regions
# If you want any authenticated user to be able to have this ability, simply return true in your implementation
# This must return true for a user if they are supposed to be able to create new pages and edit the view of a page

AbstractAuth.implement :is_admin do
  current_user.role? :admin
end

# This method should return whether the currently authenticated resource is an admin or not
# Editors only have the ability to change the content of editable regions on the page
# If you want any authenticated user to be able to have this ability, simply return true in your implementation
# In other words, this must return true for a user to have any access/management rights in the CMS
# If this returns false, the user will be redirected to the root path of the app

AbstractAuth.implement :is_editor do
  current_user.role? :editor
end
