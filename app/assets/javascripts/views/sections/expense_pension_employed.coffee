class App.Views.ExpensePensionEmployedSection extends App.Views.ExpenseSection

  id: 'expense-pension-employed-section'
  templateName: 'expense_pension_employed'

  kind: 'pension_employed'

  events: ->
    'change #epnse-none-work-income' : 'onNoneWorkIncomeChange'
    'change #spouse_epnse-none-work-income' : 'onSpouseNoneWorkIncomeChange'

  isEnabled: ->
    m = @model.toJSON()
    (m.pension_plan and not m.author) or (m.spouse_pension_plan and not m.spouse_author)

  onNoneWorkIncomeChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.epnse-form').toggle checked

  onSpouseNoneWorkIncomeChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.spouse_epnse-form').toggle checked
