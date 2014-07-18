class App.Views.StockManualISection extends App.Views.Section

  id: 'stock-manual-i-section'
  templateName: 'stock_manual_i'

  isEnabled: ->
    @viewModel.get 'stockManual'
