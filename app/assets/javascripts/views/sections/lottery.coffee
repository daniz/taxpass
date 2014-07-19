
class App.Views.LotterySection extends App.Views.Section

  id: 'lottery-section'
  templateName: 'lottery'

  events:
    'change .ltr-check' : 'onCheckChange'

  isEnabled: ->
    @model.get 'lottery'

  onCheckChange: (e) ->
    $t = $ e.currentTarget
    checked = $t.prop('checked')
    $t.siblings('.ltr-field-content').toggle checked
