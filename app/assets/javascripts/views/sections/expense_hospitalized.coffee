class App.Views.ExpenseHospitalizedSection extends App.Views.ExpenseSection

  id: 'expense-hospitalized-section'
  templateName: 'expense_hospitalized'

  kind: 'hospitalized'

  isEnabled: ->
    @model.get 'hospitalized_family'
