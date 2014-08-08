class App.Views.ExpenseBtlSection extends App.Views.ExpenseSection

  id: 'expense-btl-section'
  templateName: 'expense_btl'

  kind: 'btl'

  isEnabled: ->
    @model.get('btl_expense') or @model.get('spouse_btl_expense')

  shouldShowSpouse: ->
    super and @model.get 'spouse_btl_expense'


