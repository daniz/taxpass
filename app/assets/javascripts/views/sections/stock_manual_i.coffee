class App.Views.StockManualISection extends App.Views.Section

  id: 'stock-manual-i-section'
  templateName: 'stock_manual_i'

  isEnabled: ->
    @model.get 'stock_manual'

  getModel: ->
    @model.get('form867s').first()
