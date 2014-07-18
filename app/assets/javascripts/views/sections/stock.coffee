class App.Views.StockSection extends App.Views.Section

  id: 'stock-section'
  templateName: 'stock'

  events:
    'change [name=stk-options]' : 'onOptionsChange'

  initialize: ->
    @listenTo @model, 'change:form867', @onFormChange

  isEnabled: ->
    @model.get 'stock'

  onOptionsChange: (e) ->
    $t = $(e.currentTarget)

    if $t.is '#stk-option-upload'
      @model.set 'form867', new App.Models.Form
    else
      @model.set 'form867', null

  onFormChange: (model, form) ->
    if form
      o = 
        model             : form
        el                : '#stk-form'
        fileInputClass    : 'form867_file'
        uploadButtonLabel : 'העלה טופס 867'
        template          : 'form_upload'
        manual            : false

      new App.Views.FormUpload(o).render()

    else @$('#stk-form').empty()

  collectData: ->
    super
    manual = @$('[type=radio]:checked').is '#stk-option-manual'
    @viewModel.set 'stockManual', manual