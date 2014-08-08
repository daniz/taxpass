class App.Views.ExpenseLiteratureSection extends App.Views.ExpenseSection

  id: 'expense-literature-section'
  templateName: 'expense_literature'

  kind: 'literature'

  isEnabled: ->
    @model.get('professional_literature') or @model.get('spouse_professional_literature')

  shouldShowSpouse: ->
    super and @model.get 'spouse_professional_literature'
