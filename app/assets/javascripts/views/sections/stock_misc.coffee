class App.Views.StockMiscSection extends App.Views.Section

  id: 'stock-misc-section'
  templateName: 'stock_misc'

  events:
    'change #stm-losses' : 'onHasLossesChange'
    'change #stm-stock-account-abroad' : 'onStockAccountAbroadChange'

  isEnabled: ->
    @model.get 'stock'

  initialize: ->
    @listenTo @model, 'change:pastForm867', @onPastFormChange

  onHasLossesChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    if checked
      @model.set 'pastForm867', new App.Models.Form
    else
      @model.set 'pastForm867', null

  onPastFormChange: (model, form) ->
    if form
      o = 
        model             : form
        el                : @$ '#stm-form'
        fileInputClass    : 'pastForm867_file'
        uploadButtonLabel : 'העלה טופס 867'
        template          : 'stock_misc_upload'
        manual            : false

      new App.Views.FormUpload(o).render()

    else @$('#stm-form').empty()

  onStockAccountAbroadChange: (e) ->
    @$('#stm-abroad').toggle $(e.currentTarget).prop('checked')

