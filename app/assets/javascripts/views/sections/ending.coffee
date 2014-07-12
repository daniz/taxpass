

class App.Views.EndingSection extends App.Views.Section

  id: 'ending-section'
  templateName: 'ending'

  events:
    'click #submit-button' : 'onSubmit'

  onRender: ->
    $('#continue-button').hide()

  onSubmit: ->
    json = @serialize()
    @$('#data-input').val JSON.stringify(json)

  serialize: ->
    json = @model.toJSON()
    for attr of json
      if json[attr] instanceof Backbone.Model or json[attr] instanceof Backbone.Collection
        json[attr] = json[attr].toJSON()
    json