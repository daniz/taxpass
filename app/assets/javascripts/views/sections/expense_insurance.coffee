class App.Views.ExpenseInsuranceSection extends App.Views.Section

  id: 'expense-insurance-section'
  templateName: 'expense_insurance'

  isEnabled: ->
    @model.get 'insurance_expense'
