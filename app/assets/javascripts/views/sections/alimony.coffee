# require ../section

class App.Views.AlimonySection extends App.Views.Section

  id: 'alimony-section'
  templateName: 'alimony'

  events:
    'change #almn-married-before' : 'onChangeMarriedBefore'

  render: ->
    super
    @$('#almn-paying-wrap').toggle false
    this

  onChangeMarriedBefore: (e) ->
    @$('#almn-paying-wrap').toggle $(e.currentTarget).prop('checked')
