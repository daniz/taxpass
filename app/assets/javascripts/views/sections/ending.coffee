

class App.Views.EndingSection extends App.Views.Section

  id: 'ending-section'
  templateName: 'ending'

  events:
    'click #submit-button' : 'onSubmit'

  onRender: ->
    $('#continue-button').hide()

  onSubmit: ->
    json = @serialize()
    @serializeFileInputs()
    @$('#data-input').val JSON.stringify(json)

  serialize: ->
    json = @model.toJSON()
    for attr of json
      val = json[attr]
      if val instanceof Backbone.Model or val instanceof Backbone.Collection
        json[attr] = val.toJSON()
    json

  serializeFileInputs: ->
    @model.get('form106s').each (f) => @addFileInput f, spouse: no
    @model.get('spouseForm106s').each (f) => @addFileInput f, spouse: yes

  addFileInput: (form, o) ->
    files   = form.get 'files'
    index   = form.get 'index'
    prefix  = if o.spouse then 'spouse_' else ''

    if files?
      $('<input>', type: 'file', name: "#{ prefix }form106_#{ index }")
        .prop('files', files)
        .hide()
        .appendTo @el


  