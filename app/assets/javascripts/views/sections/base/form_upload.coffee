
class App.Views.FormUpload extends Backbone.View

  events:
    'click .form-manual-button' : 'onManualClick'
    'click .form-upload-button' : 'onUploadClick'
    'change [type=file]'        : 'onFileInputChange'
    'change .form-upload-label' : 'onLabelChange'

  # options: {}

  initialize: (@options) ->
  
  render: ->
    templateData = _.extend @model.toJSON(), @options
    html = JST[ 'form_upload' ].call @, templateData
    @$el.html html

    @ui =
      uploadBtn : @$ '.form-upload-button'
      manualBtn : @$ '.form-manual-button'

    this

  onManualClick: (e) ->
    return if @$(e.currentTarget).is '.disabled'

    dialogBody = JST[ @options.manualTemplate ].call @, @model.toJSON()

    App.Dialog.show
      head: @options.manualTitle
      body: dialogBody

    @listenToOnce App.Dialog, 'ok', =>
      App.Dialog.$('.form-data').each (i, input) =>
        $inp = $(input)
        @model.set $inp.attr('name'), $inp.val()

      @ui.uploadBtn.addClass 'disabled'
      @ui.manualBtn.addClass 'done'

  onUploadClick: (e) ->
    return if @$(e.currentTarget).is '.disabled'
    @$('[type=file]').click()

  onFileInputChange: (e) ->
    @model.set 'files', @$(e.currentTarget).prop 'files'
    @ui.uploadBtn.addClass 'done'
    @ui.manualBtn.addClass 'disabled'

  onLabelChange: (e) ->
    $t = @$ e.currentTarget
    @model.set $t.attr('name'), $t.val()





  