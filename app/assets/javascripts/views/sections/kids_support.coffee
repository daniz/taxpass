# require ../section

class App.Views.KidsSupportSection extends App.Views.Section

  id: 'kids-support-section'
  templateName: 'kids_support'

  isEnabled: ->
    !!@model.get('kids')?.length