# require ../kids_section

class App.Views.KidsDisabledSection extends App.Views.KidsSection

  id: 'kids-disabled-section'
  templateName: 'kids_disabled'

  events:
    'change #kdd-any-disabled' : 'onAnyDisabledChange'

  isEnabled: ->
    @model.hasKids()

  onAnyDisabledChange: (e) ->
    @$('#kdd-kids-list').toggle $(e.currentTarget).prop('checked')