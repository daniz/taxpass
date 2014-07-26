class App.Views.ExpenseCpaSection extends App.Views.ExpenseSection

  id: 'expense-cpa-section'
  templateName: 'expense_cpa'

  kind: 'cpa'

  isEnabled: ->
    @model.get 'cpa_expense'
