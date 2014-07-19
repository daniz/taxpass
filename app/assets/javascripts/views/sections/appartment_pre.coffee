class App.Views.AppartmentPreSection extends App.Views.Section

  id: 'appartment-pre-section'
  templateName: 'appartment_pre'

  isEnabled: ->
    @model.get 'appartment'

  onRender: ->
    n = @model.get('appartments')?.length 
    if n
      @$('#apr-num-appts').val n

  collectData: ->
    unless @model.has 'appartments'
      @model.set 'appartments', new Backbone.Collection
      
    appts = @model.get 'appartments'
    n = parseInt @$('#apr-num-appts').val()

    if n != appts.length
      appts.reset()
      for i in [1..n]
        appts.add new App.Models.Appartment
            index         : i
            spouseName   : @model.get('spouse_name')

