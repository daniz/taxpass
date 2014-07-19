class App.Views.AppartmentISection extends App.Views.Section

  id: 'appartment-i-section'
  templateName: 'appartment_i'

  isEnabled: ->
    !!@model.get('appartments')?.length

  onRender: ->
    html = @model.get('appartments').map (appt) ->
      v = new App.Views.AppartmentIDetails model: appt
      v.render().el

    @$('#apti-content').html html