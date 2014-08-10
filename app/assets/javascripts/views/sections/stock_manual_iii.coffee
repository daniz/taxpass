class App.Views.StockManualIIISection extends App.Views.Section

  id: 'stock-manual-iii-section'
  templateName: 'stock_manual_iii'

  isEnabled: ->
    @model.get 'stock_manual'

  getModel: ->
    @model.get('form867s').first()