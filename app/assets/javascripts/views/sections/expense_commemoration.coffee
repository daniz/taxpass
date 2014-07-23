class App.Views.ExpenseCommemorationSection extends App.Views.Section

  id: 'expense-commemoration-section'
  templateName: 'expense_commemoration'

  events:
    'change #has-receipts' : 'onHasReceiptsChange'
    'change #spouse_has-receipts' : 'onSpouseHasReceiptsChange'

  isEnabled: ->
    @model.get 'commemoration'

  onHasReceiptsChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.upload').toggle checked
    @$('.commemoration-type-container').toggle !checked

  onSpouseHasReceiptsChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.spouse_upload').toggle checked
    @$('.spouse_commemoration-type-container').toggle !checked