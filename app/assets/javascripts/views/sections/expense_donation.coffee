class App.Views.ExpenseDonationSection extends App.Views.ExpenseSection

  id: 'expense-donation-section'
  templateName: 'expense_donation'

  kind: 'donation'

  isEnabled: ->
    @model.get('public_donation') or @model.get('spouse_public_donation')

  shouldShowSpouse: ->
    super and @model.get 'spouse_public_donation'

