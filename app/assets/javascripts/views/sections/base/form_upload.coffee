
class App.Views.FormUpload extends Backbone.View

  events:
    'click .form-manual-button' : 'onManualClick'
    'click .form-upload-button' : 'onUploadClick'
    'change [type=file]'        : 'onFileInputChange'

  options: {}

  initialize: (options) ->
    _.extend @options, options
  
  render: ->
    templateData = _.extend @model.toJSON(), @options
    html = JST[ @options.template ].call @, templateData
    @$el.html html
    this

  onManualClick: (e) ->
    return if @$(e.currentTarget).is '.disabled'

    dialogBody = JST[ @options.manualTemplate ].call @, @model.toJSON()

    App.Dialog.show
      head: @options.manualDialogHead
      body: dialogBody

    @listenToOnce App.Dialog, 'ok', =>
      App.Dialog.$('.form-data').each (i, input) =>
        $inp = $(input)
        @model.set $inp.attr('name'), $inp.val()

      @$('.form-upload-button').addClass 'disabled'
      @$('.form-manual-button').addClass 'done'

  onUploadClick: (e) ->
    return if @$(e.currentTarget).is '.disabled'
    @$('[type=file]').click()

  onFileInputChange: (e) ->
    @model.set 'files', @$(e.currentTarget).prop 'files'
    @$('.form-upload-button').addClass 'done'
    @$('.form-manual-button').addClass 'disabled'


  