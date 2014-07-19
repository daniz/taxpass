class App.Views.ExpenseBtlSection extends App.Views.Section

  id: 'expense-btl-section'
  templateName: 'expense_btl'

  isEnabled: ->
    @model.get 'btl_expense'
