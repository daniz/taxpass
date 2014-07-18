class App.Views.Section extends Backbone.View

  tagName: 'section'

  constructor: (o) ->
    super
    @viewModel = o.viewModel

  template: (data) ->
    JST[@templateName].call this, data

  templateJSON: ->
    @model?.toJSON()

  render: ->
    data = @templateJSON()
    @$el.html @template(data)
    @delegateEvents()
    @onRender()
    this

  onRender: ->

  collectData: ->
    @$('.request-data').each (i, input) =>
      $input = $(input)
      @model.set $input.attr('name'), @getFieldValue $input

      console.log "model.set #{ $input.attr('name') }, #{ @getFieldValue $input }"

  getFieldValue: (input) ->
    $input = $(input)
    if $input.attr('type') is 'checkbox'
      $input.prop 'checked'
    else if $input.is 'select' or $input.attr('type') is 'number'
      parseInt $input.val()
    else
      $input.val()

  isEnabled: -> yes