class App.Views.AcademiaSection extends App.Views.Section

  id: 'academia-section'
  templateName: 'academia'

  isEnabled: ->
    m = @model.toJSON()
    m.academic or m.spouse_academic