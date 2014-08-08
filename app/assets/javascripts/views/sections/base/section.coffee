class App.Views.Section extends Backbone.View

  tagName: 'section'

  constructor: (o) ->
    super
    @viewModel = o.viewModel

  getModel: -> @model

  template: (data) ->
    JST[@templateName].call this, data

  templateJSON: ->
    json = @getModel()?.toJSON()
    _.extend json, showSpouse: @shouldShowSpouse()

  render: ->
    data = @templateJSON()
    @$el.html @template(data)
    @delegateEvents()
    @onRender()
    this

  onRender: ->

  collectData: ->
    model = @getModel()

    @$('.request-data').each (i, input) =>
      $input = $(input)
      model.set $input.attr('name'), @getFieldValue $input

      console.log "model.set #{ $input.attr('name') }, #{ @getFieldValue $input }"

  getFieldValue: (input) ->
    $input = $(input)
    val = $input.val()

    if $input.attr('type') is 'checkbox'
      $input.prop 'checked'
    else if $input.is('select') or $input.attr('type') is 'number'
      if val then parseInt(val) else 0 # might not make sense for select...
    else
      val

  isEnabled: -> yes

  shouldShowSpouse: ->
    @viewModel.get 'showSpouse'