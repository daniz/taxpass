# require ../section

class App.Views.WidowedIntroSection extends App.Views.Section

  id: 'widowed-intro-section'
  templateName: 'widowed_intro'

  isEnabled: ->
    @model.get 'is_widowed'