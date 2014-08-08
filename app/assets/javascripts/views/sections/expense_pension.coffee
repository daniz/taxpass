class App.Views.ExpensePensionSection extends App.Views.ExpenseSection

  id: 'expense-pension-section'
  templateName: 'expense_pension'

  kind: 'pension'

  events: ->
    'change #epns-work-loss' : 'onWorkLossChange'
    'change #spouse_epns-work-loss' : 'onSpouseWorkLossChange'

  isEnabled: ->
    m = @model.toJSON()
    (m.pension_plan and m.author) or (m.spouse_pension_plan and m.spouse_author) 

  shouldShowSpouse: ->
    super and @model.get 'spouse_pension_plan'

  onWorkLossChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.epns-form').toggle checked

  onSpouseWorkLossChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.spouse_epns-form').toggle checked