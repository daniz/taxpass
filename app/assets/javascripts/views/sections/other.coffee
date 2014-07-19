class App.Views.OtherSection extends App.Views.Section

  id: 'other-section'
  templateName: 'other'

  events:
    'change [type=checkbox]' : 'onCheckChange'

  onCheckChange: (e) ->
    $t = @$ e.currentTarget
    checked = $t.prop('checked')
    $t.siblings('.otr-sub').toggle checked
    