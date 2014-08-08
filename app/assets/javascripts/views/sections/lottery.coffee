
class App.Views.LotterySection extends App.Views.Section

  id: 'lottery-section'
  templateName: 'lottery'

  events:
    'change .ltr-check' : 'onCheckChange'

  isEnabled: ->
    @model.get('lottery') or @model.get('spouse_lottery')

  shouldShowSpouse: ->
    super and @model.get 'spouse_lottery'

  onCheckChange: (e) ->
    $t = $ e.currentTarget
    checked = $t.prop('checked')
    $t.siblings('.ltr-field-content').toggle checked
