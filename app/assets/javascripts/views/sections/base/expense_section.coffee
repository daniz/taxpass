#= require ./section

class App.Views.ExpenseSection extends App.Views.Section

  kind: '' # override me

  onRender: ->
    unless @model.get 'receipts'
      @model.set 'receipts', new App.Collections.Forms

    # unless @model.get 'spouseReceipts'
    #   @model.set 'spouseReceipts', new App.Collection.Forms

    # model = new App.Models.Form
    #   kind: @kind

    # spouseModel = new App.Models.Form
    #   kind: @kind

    # @model.get('receipts').add model
    # @model.get('spouseReceipts').add spouseModel

    receipts = @model.get 'receipts'

    model = new App.Models.Form
      kind  : @kind
      spouse: no
    receipts.add model 

    view = new App.Views.FormUpload
      el          : @$('.upload')
      model       : model
      label       : no
      manual      : no
    view.render()

    if @model.get 'spouse_name'
      spouseModel = new App.Models.Form
        kind  : @kind
        spouse: yes
      receipts.add spouseModel  

      spouseView = new App.Views.FormUpload
        el          : @$('.spouse_upload')
        model       : spouseModel
        label       : no
        manual      : no
      spouseView.render()
    