

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
    @model.get('form106s').each (f) => @addFileInput f, spouse: no, name: 'form106'
    @model.get('spouseForm106s').each (f) => @addFileInput f, spouse: yes, name: 'form106'

    @addFileInput @model.get('form857'), spouse: no, name: 'form857'
    @addFileInput @model.get('spouseForm857'), spouse: yes, name: 'form857'

    @model.get('btlForms').each (f) => @addFileInput f, spouse: no, name: 'btlForm'
    @model.get('spouseBtlForms').each (f) => @addFileInput f, spouse: yes, name: 'btlForm'

    @addFileInput @model.get('pensionForm'), spouse: no, name: 'pensionForm'
    @addFileInput @model.get('spousePensionForm'), spouse: yes, name: 'pensionForm'

  addFileInput: (form, o) ->
    return unless form

    files   = form.get 'files'
    index   = form.get 'index'
    type    = form.get 'type'
    prefix  = if o.spouse then 'spouse_' else ''
    suffix  = if index or type then "_#{ index ? type }" else ''

    if files?
      $('<input>', type: 'file', name: "#{ prefix }#{ o.name }#{ suffix }")
        .prop('files', files)
        .hide()
        .appendTo @el


  