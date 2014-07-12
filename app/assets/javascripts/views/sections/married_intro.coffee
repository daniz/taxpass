

class App.Views.MarriedIntroSection extends App.Views.Section

  id: 'married-intro-section'
  templateName: 'married_intro'

  events:
    'click #mit-spouse-too' : 'onSpouseTooClick'

  isEnabled: ->
    m = @model.toJSON()
    !m.is_widowed and m.is_married

  onSpouseTooClick: ->
    @$('#mit-spouse-too, #mit-only-me').hide()
    @$('#mit-spouse-name-dialog').show()