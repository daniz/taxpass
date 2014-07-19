class App.Views.ExpenseHospitalizedSection extends App.Views.Section

  id: 'expense-hospitalized-section'
  templateName: 'expense_hospitalized'

  isEnabled: ->
    @model.get 'hospitalized_family'
