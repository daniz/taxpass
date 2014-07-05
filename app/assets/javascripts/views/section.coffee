class App.Views.Section extends Backbone.View

  tagName: 'section'

  template: (data) ->
    JST[@templateName].call this, data

  templateJSON: ->
    @model?.toJSON()

  render: ->
    data = @templateJSON()
    @$el.html @template(data)
    @delegateEvents()
    this

  collectData: ->
    @$('.request-data').each (i, input) =>
      $input = $(input)
      @model.set $input.attr('id'), @getFieldValue $input

      console.log "model.set #{ $input.attr('id') }, #{ @getFieldValue $input }"

  getFieldValue: ($input) ->
    if $input.attr('type') is 'checkbox'
      $input.prop 'checked'
    else
      $input.val()

  isEnabled: -> yes
  

