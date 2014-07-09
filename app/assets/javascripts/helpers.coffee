App.Helpers =

  checkbox: ->
    @_helper('checkbox').apply @, arguments

  toggleButton: ->
    @_helper('toggle_button').apply @, arguments

  select: ->
    @_helper('select').apply @, arguments

  date: ->
    @_helper('date').apply @, arguments

  input: ->
    @_helper('input').apply @, arguments

  _helper: (name) ->
    JST["helpers/#{ name }"]