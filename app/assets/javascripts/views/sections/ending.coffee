class App.Views.EndingSection extends App.Views.Section

  id: 'ending-section'
  templateName: 'ending'

  events:
    'click #submit-button' : 'onSubmit'

  onRender: ->
    $('#continue-button').hide()

  onSubmit: ->
    @model.set flow: 'done', current_section: ''
    @trigger 'save'