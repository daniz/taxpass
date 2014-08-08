

class App.Views.WidowedIntroSection extends App.Views.Section

  id: 'widowed-intro-section'
  templateName: 'widowed_intro'

  initialize: ->
    @listenTo @model, 'change:deceased_spouse_name', @onDeceasedSpouseNameChange
    @listenTo @model, 'change:spouse_death_date', @onSpouseDeathDateChange

  isEnabled: ->
    @model.get 'is_widowed'

  onSpouseDeathDateChange: (model, date) ->
    deathTime = (new Date date).getTime()
    now = (new Date).getTime()
    oneYearInMillisec = 365 * 24 * 60 * 60 * 1000
    if now - deathTime < oneYearInMillisec
      @viewModel.set 'showSpouse', yes