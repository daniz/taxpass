class App.Views.ExpensePensionEmployedSection extends App.Views.Section

  id: 'expense-pension-employed-section'
  templateName: 'expense_pension_employed'

  isEnabled: ->
    @model.get('pension_plan') and not @model.get('author')
