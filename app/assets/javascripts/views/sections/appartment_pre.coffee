class App.Views.AppartmentPreSection extends App.Views.Section

  id: 'appartment-pre-section'
  templateName: 'appartment_pre'

  isEnabled: ->
    @model.get 'appartment'

  collectData: ->
    numAppts = parseInt @$('#apr-num-appts').val()
    @viewModel.set 'numAppts', numAppts