class App.Views.ExpenseInsuranceSection extends App.Views.ExpenseSection

  id: 'expense-insurance-section'
  templateName: 'expense_insurance'

  kind: 'insurance'

  isEnabled: ->
    @model.get('insurance_expense') or @model.get('spouse_insurance_expense')

  shouldShowSpouse: ->
    super and @model.get 'spouse_insurance_expense'

