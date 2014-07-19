class App.Views.AppartmentIISection extends App.Views.Section

  id: 'appartment-ii-section'
  templateName: 'appartment_ii'

  isEnabled: ->
    !!@model.get('appartments')?.length

  onRender: ->
    html = @model.get('appartments').map (appt) ->
      v = new App.Views.AppartmentIIItem model: appt
      v.render().el

    @$('#aptii-table tbody').html html