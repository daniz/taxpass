# require ../section

class App.Views.KidsDisabledSection extends App.Views.Section

  id: 'kids-disabled-section'
  templateName: 'kids_disabled'

  isEnabled: ->
    !!@model.get('kids')?.length