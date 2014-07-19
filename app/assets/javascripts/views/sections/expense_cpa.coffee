class App.Views.ExpenseCpaSection extends App.Views.Section

  id: 'expense-cpa-section'
  templateName: 'expense_cpa'

  isEnabled: ->
    @model.get 'cpa_expense'
