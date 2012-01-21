Comnspace.Views.Extensions ||= {}

Comnspace.Views.Extensions.Form =

  label: (method, options = {}) ->
    "<label for=\"#{@object_name}_#{method}\"> #{@humanize method}:</label>"
    
  textField: (method, options = {}) ->
    @inputTag "text", method, options
    
  hiddenField: (method, options = {}) ->
    @inputTag "hidden", method, options

  numberField: (method, options = {}) ->
    @inputTag "number", method, options
    
  checkBox: (method, options = {}) ->
    @inputTag "checkbox", method, options

  inputTag: (type, method, options) ->
    value = if this[method]? then this[method] else ""
    opt_str = @getOptionsString(options)
    "<input type=\"#{type}\" id=\"#{@object_name}_#{method}\" name=\"#{method}\" value=\"#{value}\"  #{opt_str}/>"
    
  textArea: (method, options = {}) ->
    value = if this[method]? then this[method] else ""
    opt_str = @getOptionsString(options)
    "<textarea id=\"#{@object_name}_#{method}\" name=\"#{method}\" #{opt_str}>#{value}</textarea>"
    
  getOptionsString: (options) ->
    opt_str = ""
    for key, value of options
      opt_str += "#{key}=\"#{value}\" "
    opt_str
  