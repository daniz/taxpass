class App.Views.StockPreSection extends App.Views.Section

  id: 'stock-pre-section'
  templateName: 'stock_pre'

  isEnabled: ->
    m = @model.toJSON()
    m.spouse_name and m.stock