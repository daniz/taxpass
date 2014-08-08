class App.Views.StockSection extends App.Views.Section

  id: 'stock-section'
  templateName: 'stock'

  events:
    'change [name=stk-options]' : 'onOptionsChange'

  initialize: ->
    @forms = @model.get 'form867s'
    @forms.add new App.Models.Form

  onRender: ->
    o = 
      model             : @forms.first()
      label             : no
      el                : @$ '#stk-form'
      uploadButtonLabel : 'העלה טופס 867'
      manual            : no

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