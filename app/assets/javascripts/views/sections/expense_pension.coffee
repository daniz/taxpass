class App.Views.ExpensePensionSection extends App.Views.ExpenseSection

  id: 'expense-pension-section'
  templateName: 'expense_pension'

  kind: 'pension'

  events: ->
    'change #epns-work-loss' : 'onWorkLossChange'
    'change #spouse_epns-work-loss' : 'onSpouseWorkLossChange'

  isEnabled: ->
    @model.get('pension_plan') and @model.get('author')

  onWorkLossChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.epns-form').toggle checked

  onSpouseWorkLossChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.spouse_epns-form').toggle checked