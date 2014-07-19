class App.Views.ExpenseLiteratureSection extends App.Views.Section

  id: 'expense-literature-section'
  templateName: 'expense_literature'

  isEnabled: ->
    @model.get 'professional_literature'
