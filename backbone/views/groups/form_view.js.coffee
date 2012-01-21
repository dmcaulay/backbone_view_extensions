Comnspace.Views.Groups ||= {}

class Comnspace.Views.Groups.FormView extends Backbone.View
  template: JST["backbone/templates/groups/form"]

  id: "content"
  
  events:
    "submit #group-form": "save"
  
  constructor: (options) ->
    super(options)

    @model.bind("change:errors", () =>
      @render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    @model.set(user_list: @$('#group_user_list').val())
    
    @model.save(null, 
      success: (group) =>
        @model = group
        @options.parent_view.addNew(@model)
        
      error: (post, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    group_users = @model.get("users")
    user_list = if group_users? then group_users.reduce(((list, u) -> list + u.username + ", "), "") else ""
    @model.set(user_list: user_list)
    
    $(@el).html(@template(_.extend(
          @model.toJSON(),
          object_name: "group",
          form_title: @options.form_title,
          Comnspace.Views.Extensions.Text,
          Comnspace.Views.Extensions.Form
        )
      ))
        
    @$('#group_user_list').autocomplete(
      collections: 
        users: @options.users
      attr: 'username'
      ul_class: 'autocomplete'
      ul_css: {'z-index':1234}
      multiple: true
    )
    
    this.$("form").backboneLink(@model)
    
    this