

class App.Views.SpecialAreaSection extends App.Views.Section

  id: 'special-area-section'
  templateName: 'special_area'

  isEnabled: ->
    m = @model.toJSON()
    m.special_area_resident or m.spouse_special_area_resident