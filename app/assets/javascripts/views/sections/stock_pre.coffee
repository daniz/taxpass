class App.Views.StockPreSection extends App.Views.Section

  id: 'stock-pre-section'
  templateName: 'stock_pre'

  isEnabled: ->
    m = @model.toJSON()
    @shouldShowSpouse() and m.stock

  collectData: ->
    val = @$('[type=radio]:checked').data 'val'
    @viewModel.set 'stockAccount', val