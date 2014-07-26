class App.Views.ExpenseCourseSection extends App.Views.ExpenseSection

  id: 'expense-course-section'
  templateName: 'expense_course'

  kind: 'course'

  isEnabled: ->
    @model.get 'professional_course'
