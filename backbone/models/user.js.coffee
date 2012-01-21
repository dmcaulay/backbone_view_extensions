class Comnspace.Models.User extends Backbone.Model
  urlRoot: 'contacts'
  idAttribute: '_id'

  defaults:
    username: null
    profile_image_path: null
    groups: null
    feeds: null
    tags: null
    
class Comnspace.Collections.UsersCollection extends Backbone.Collection
  model: Comnspace.Models.User
  url: "/contacts"

