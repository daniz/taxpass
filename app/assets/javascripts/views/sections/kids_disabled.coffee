# require ../section

class App.Views.KidsDisabledSection extends App.Views.Section

  id: 'kids-disabled-section'
  templateName: 'kids_disabled'

  events:
    'change #kdd-any-disabled' : 'onAnyDisabledChange'

  isEnabled: ->
    !!@model.get('kids')?.length

  onAnyDisabledChange: (e) ->
    @$('#kdd-kids-list').toggle $(e.currentTarget).prop('checked')