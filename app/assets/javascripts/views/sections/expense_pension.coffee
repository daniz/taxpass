class App.Views.ExpensePensionSection extends App.Views.Section

  id: 'expense-pension-section'
  templateName: 'expense_pension'

  isEnabled: ->
    @model.get 'pension_plan'
