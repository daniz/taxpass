class App.Views.ExpenseDonationSection extends App.Views.ExpenseSection

  id: 'expense-donation-section'
  templateName: 'expense_donation'

  kind: 'donation'

  isEnabled: ->
    @model.get 'public_donation'
