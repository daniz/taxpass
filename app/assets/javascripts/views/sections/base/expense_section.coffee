#= require ./section

class App.Views.ExpenseSection extends App.Views.Section

  kind: '' # override me

  onRender: ->
    unless @model.get 'receipts'
      @model.set 'receipts', new Backbone.Collection

    unless @model.get 'spouseReceipts'
      @model.set 'spouseReceipts', new Backbone.Collection

    model = new App.Models.Receipt
      kind: @kind

    spouseModel = new App.Models.Receipt
      kind: @kind

    @model.get('receipts').add model
    @model.get('spouseReceipts').add spouseModel

    new App.Views.ReceiptUpload
      el          : @$('.upload')
      model       : model

    new App.Views.ReceiptUpload
      el          : @$('.spouse_upload')
      model       : spouseModel
    