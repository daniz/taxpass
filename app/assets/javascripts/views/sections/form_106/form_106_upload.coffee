
class App.Views.Form106Upload extends Backbone.View

  tagName: 'li'

  events:
    'change .workplace'         : 'onWorkplaceChange'
    'click .f106-manual-button' : 'onManualClick'
    'click .f106-upload-button' : 'onUploadClick'
    'change [type=file]'        : 'onFileInputChange'

  initialize: ({@spouse}) ->

  render: (o) ->
    html = JST['form_106_upload'].call @, _.extend {spouse: @spouse}, @model.toJSON()
    @$el.html html
    this

  onWorkplaceChange: ->
    $wp   = @$ '.workplace'
    attr  = $wp.attr('name')
    val   = $wp.val()

    @model.set attr, val

  onManualClick: (e) ->
    return if @$(e.currentTarget).is '.disabled'

    dialogBody = JST['form_106_manual'].call @, @model.toJSON()

    App.Dialog.show
      head: 'טופס 106'
      body: dialogBody

    @listenToOnce App.Dialog, 'ok', =>
      App.Dialog.$('.form-data').each (i, input) =>
        $inp = $(input)
        @model.set $inp.attr('name'), $inp.val()

      @$('.f106-upload-button').addClass 'disabled'
      @$('.f106-manual-button').addClass 'done'

  onUploadClick: (e) ->
    return if @$(e.currentTarget).is '.disabled'
    @$('[type=file]').click()

  onFileInputChange: ->
    @$('.f106-upload-button').addClass 'done'
    @$('.f106-manual-button').addClass 'disabled'    

  