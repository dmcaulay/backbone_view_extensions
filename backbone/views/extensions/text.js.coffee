Comnspace.Views.Extensions ||= {}

Comnspace.Views.Extensions.Text =
  
  pluralize: (count, singular, plural = singular + 's') ->
    "#{count || 0} " + (if (count == 1 || count == '1') then singular else plural)
    
  capitalize: (value) ->
    value.charAt(0).toUpperCase() + value.substring(1).toLowerCase()
    
  humanize: (value) ->
    value.replace(/(?:^|_)(.)/g, (match, chr) -> if chr? then " " + chr.toUpperCase() else '')
