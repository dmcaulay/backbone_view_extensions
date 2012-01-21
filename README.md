Backbone View Extensions
========================
This repo has some view extensions that allow you to do some cool stuff in your Backbone views. I'm currently using Eco templating, but I think the code could be used with any Javascript templating library. Here's an example of using the extension classes in your Backbone View's render method:

  $(@el).html(@template(_.extend(
        @model.toJSON(),
        object_name: "group",
        form_title: @options.form_title,
        Comnspace.Views.Extensions.Text,
        Comnspace.Views.Extensions.Form
      )
  ))
  
You can see that I use the _.extend method to add additional fields to the model object (kinda like a ruby mixin). Backbone doesn't have anything like Rails ActionView FormHelper so I made something similar for Javascript templates. My Text and Form classes allow me to write things like this in my form template:

  <div class="field">
    <%- @label "name" %><br />
    <%- @textField "name" %>
  </div>

You can see that it looks very similar to a Rails erb file. Pretty cool, right? You can take a look at my Form and Text classes to see how simple it was. I also have a Time class that can be used to get things like get time_ago_in_words(time).

Let me know what you think.