

class App.Views.KidsSpouseSection extends App.Views.Section

  id: 'kids-spouse-section'
  templateName: 'kids_spouse'

  isEnabled: ->
    @model.get 'is_married' and @model.hasKids()