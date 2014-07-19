class App.Views.ExpenseCommemorationSection extends App.Views.Section

  id: 'expense-commemoration-section'
  templateName: 'expense_commemoration'

  isEnabled: ->
    @model.get 'commemoration'
