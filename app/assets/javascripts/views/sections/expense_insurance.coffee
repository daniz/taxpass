class App.Views.ExpenseInsuranceSection extends App.Views.ExpenseSection

  id: 'expense-insurance-section'
  templateName: 'expense_insurance'

  kind: 'insurance'

  isEnabled: ->
    @model.get 'insurance_expense'
