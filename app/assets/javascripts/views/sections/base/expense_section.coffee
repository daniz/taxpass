#= require ./section

class App.Views.ExpenseSection extends App.Views.Section

  kind: '' # override me

  onRender: ->
    unless @model.get 'receipts'
      @model.set 'receipts', new App.Collections.Forms

    receipts = @model.get 'receipts'

    receipt = receipts.findWhere kind: @kind, spouse: no
    unless receipt?
      receipt = new App.Models.Form
        kind  : @kind
        spouse: no
      receipts.add receipt 

    view = new App.Views.FormUpload
      el          : @$('.upload')
      model       : receipt
      label       : no
      manual      : no
    view.render()

    if @shouldShowSpouse()

      spouseReceipt = receipts.findWhere kind: @kind, spouse: yes
      unless spouseReceipt?
        spouseReceipt = new App.Models.Form
          kind  : @kind
          spouse: yes
        receipts.add spouseReceipt  

      spouseView = new App.Views.FormUpload
        el          : @$('.spouse_upload')
        model       : spouseReceipt
        label       : no
        manual      : no
      spouseView.render()
    