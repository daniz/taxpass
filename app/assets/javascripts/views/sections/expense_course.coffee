class App.Views.ExpenseCourseSection extends App.Views.ExpenseSection

  id: 'expense-course-section'
  templateName: 'expense_course'

  kind: 'course'

  isEnabled: ->
    @model.get('professional_course') or @model.get('spouse_professional_course')

  shouldShowSpouse: ->
    super and @model.get('spouse_professional_course')
