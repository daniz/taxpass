class App.Views.ExpenseHospitalizedSection extends App.Views.ExpenseSection

  id: 'expense-hospitalized-section'
  templateName: 'expense_hospitalized'

  kind: 'hospitalized'

  isEnabled: ->
    @model.get('hospitalized_family') or @model.get('spouse_hospitalized_family')

  shouldShowSpouse: ->
    super and @model.get 'spouse_hospitalized_family'
