# App.Helpers =

#   checkbox: ->
#     @_helper('checkbox').apply @, arguments

#   toggleButton: ->
#     @_helper('toggle_button').apply @, arguments

#   select: ->
#     @_helper('select').apply @, arguments

#   date: ->
#     @_helper('date').apply @, arguments

#   input: ->
#     @_helper('input').apply @, arguments

#   userName: ->
#     @_helper('user_name').apply @, arguments

#   spouseName: ->
#     @_helper('spouse_name').apply @, arguments

#   _helper: (name) ->
#     JST["helpers/#{ name }"]

App.help = (templateName, data) ->
  JST["helpers/#{ templateName }"].call @, data  
