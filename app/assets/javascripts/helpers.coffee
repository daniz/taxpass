App.Helpers =

  checkbox: ->
    @_helper('checkbox').apply(this, arguments)

  _helper: (name) ->
    JST["helpers/#{ name }"]