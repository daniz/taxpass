class App.Views.ExpenseCourseSection extends App.Views.Section

  id: 'expense-course-section'
  templateName: 'expense_course'

  isEnabled: ->
    @model.get 'professional_course'
