class Comnspace.Models.Group extends Backbone.Model
  urlRoot: 'groups'
  idAttribute: '_id'

  defaults:
    name: null
    description: null
    privacy: 0
    owner: null

class Comnspace.Collections.GroupsCollection extends Backbone.Collection
  model: Comnspace.Models.Group
  url: "/groups"
