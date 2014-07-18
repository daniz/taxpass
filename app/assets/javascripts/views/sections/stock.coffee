class App.Views.StockSection extends App.Views.Section

  id: 'stock-section'
  templateName: 'stock'

  events:
    'change [name=stk-options]' : 'onOptionsChange'

  onRender: ->
    unless @model.has 'form867'
      @model.set 'form867', new App.Models.Form

    o = 
      model             : @model.get 'form867'
      el                : @$ '#stk-form'
      fileInputClass    : 'form867_file'
      uploadButtonLabel : 'העלה טופס 867'
      template          : 'form_upload'
      manual            : false

    new App.Views.FormUpload(o).render()

  isEnabled: ->
    @model.get 'stock'

  onOptionsChange: (e) ->
    upload = $(e.currentTarget).is '#stk-option-upload'
    @$('#stk-form').toggle upload

  collectData: ->
    super
    manual = @$('[type=radio]:checked').is '#stk-option-manual'
    @viewModel.set 'stockManual', manual