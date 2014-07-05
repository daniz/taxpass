App.Helpers =

  checkbox: ->
    @_helper('checkbox').apply(this, arguments)

  toggleButton: ->
    @_helper('toggle_button').apply(this, arguments)

  _helper: (name) ->
    JST["helpers/#{ name }"]