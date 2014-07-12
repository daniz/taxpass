

class App.Views.WidowedIntroSection extends App.Views.Section

  id: 'widowed-intro-section'
  templateName: 'widowed_intro'

  initialize: ->
    @listenTo @model, 'change:deceased_spouse_name', @onDeceasedSpouseNameChange

  isEnabled: ->
    @model.get 'is_widowed'

  onDeceasedSpouseNameChange: ->
    @model.set 'spouse_name', @model.get('deceased_spouse_name')
