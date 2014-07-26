class App.Views.ExpensePensionEmployedSection extends App.Views.ExpenseSection

  id: 'expense-pension-employed-section'
  templateName: 'expense_pension_employed'

  kind: 'pension_employed'

  events: ->
    'change #epnse-none-work-income' : 'onNoneWorkIncomeChange'
    'change #spouse_epnse-none-work-income' : 'onSpouseNoneWorkIncomeChange'

  isEnabled: ->
    @model.get('pension_plan') and not @model.get('author')

  onNoneWorkIncomeChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.epnse-form').toggle checked

  onSpouseNoneWorkIncomeChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.spouse_epnse-form').toggle checked
