class App.Views.StockMiscSection extends App.Views.Section

  id: 'stock-misc-section'
  templateName: 'stock_misc'

  events:
    'change #stm-losses' : 'onHasLossesChange'
    'change #stm-stock-account-abroad' : 'onStockAccountAbroadChange'

  isEnabled: ->
    @model.get 'stock'

  initialize: ->
    # @listenTo @model, 'change:pastForm867', @onPastFormChange
    @forms = @model.get 'form867s'
    @form = @forms.findWhere old: yes
    unless @form
      @form = new App.Models.Form(old: yes)
      @forms.add @form

  onRender: ->
    o = 
      model   : @form
      el      : @$ '#stm-form'
      label   : false
      manual  : false

    view = new App.Views.FormUpload(o).render()
    view.$el.hide()

  onHasLossesChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('#stm-form').toggle checked
    # if checked
    #   @model.set 'pastForm867', new App.Models.Form
    # else
    #   @model.set 'pastForm867', null

  # onPastFormChange: (model, form) ->
  #   if form
  #     o = 
  #       model   : form
  #       el      : @$ '#stm-form'
  #       label   : false
  #       manual  : false

  #     new App.Views.FormUpload(o).render()

  #   else @$('#stm-form').empty()

  onStockAccountAbroadChange: (e) ->
    @$('#stm-abroad').toggle $(e.currentTarget).prop('checked')

  collectData: ->
    super
    hasLosses = $('#stm-losses').prop 'checked'
    unless hasLosses
      @forms.remove @form

