class App.Views.StockManualIIISection extends App.Views.Section

  id: 'stock-manual-iii-section'
  templateName: 'stock_manual_iii'

  isEnabled: ->
    @viewModel.get 'stockManual'

  getModel: ->
    @model.get 'form867'