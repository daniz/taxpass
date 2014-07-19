class App.Views.ExpenseDonationSection extends App.Views.Section

  id: 'expense-donation-section'
  templateName: 'expense_donation'

  isEnabled: ->
    @model.get 'public_donation'
