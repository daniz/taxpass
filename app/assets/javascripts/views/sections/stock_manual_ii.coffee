class App.Views.StockManualIISection extends App.Views.Section

  id: 'stock-manual-ii-section'
  templateName: 'stock_manual_ii'

  isEnabled: ->
    @model.get 'stock_manual'

  getModel: ->
    @model.get('form867s').first()

