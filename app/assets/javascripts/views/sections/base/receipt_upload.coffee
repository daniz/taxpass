
class App.Views.ReceiptUpload extends Backbone.View

  events:
    'click .form-upload-button' : 'onUploadClick'
    'change [type=file]'        : 'onFileInputChange'

  initialize: (@options) ->
    @render()
  
  render: ->
    html = JST['receipt_upload'].call @
    @$el.html html
    this

  onUploadClick: (e) ->
    @$('[type=file]').click()

  onFileInputChange: (e) ->
    @model.set 'files', @$(e.currentTarget).prop 'files'