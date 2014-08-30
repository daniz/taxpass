class App.Views.Section extends Backbone.View

  tagName: 'section'

  constructor: (o) ->
    super
    @viewModel = o.viewModel

    @events ?= {}
    _.extend @events,
      'click .help-button' : 'showHelp'
      'click .help-button .fa-times' : 'closeHelp'

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

    _.defer =>
      $('.date-input').datepicker
        changeYear: yes
        changeMonth: yes

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
    @model.get 'include_spouse'

  showHelp: (e) ->
    $btn = @$ e.currentTarget
    text = $btn.data 'text'
    return unless text

    $tool = $('<div>')
      .addClass('tooltip')
      .text(text)
      .css(top: -16, right: $btn.width() + 16)
      .appendTo($btn)
      .hide()
      .fadeIn(200)

    $tool.append $('<span>', 'class' : 'fa fa-times')

    return false

  closeHelp: (e) ->
    $(e.currentTarget).closest('.tooltip').fadeOut 200, -> $(this).remove()
    return false

