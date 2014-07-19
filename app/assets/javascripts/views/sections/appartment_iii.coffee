class App.Views.AppartmentIIISection extends App.Views.Section

  id: 'appartment-iii-section'
  templateName: 'appartment_iii'

  events:
    'change #aptiii-mortgage' : 'onMortgageChange'

  isEnabled: ->
    !!@model.get('appartments')?.length

  onRender: ->
    html = @model.get('appartments').map (appt) ->
      v = new App.Views.AppartmentIIIItem model: appt
      v.render().el

    @$('#aptiii-table tbody').html html

  onMortgageChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('#aptiii-table').toggle checked