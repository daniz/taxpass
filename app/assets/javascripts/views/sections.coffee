class App.Views.Sections extends Backbone.View

  sections: [
    App.Views.TaxYearSection
    App.Views.MaritalStatusSection
    App.Views.MarriedIntroSection
    App.Views.WidowedIntroSection
    App.Views.PersonalOverviewSection
    App.Views.PersonalTaxStatusSection
    App.Views.SpecialAreaSection
    App.Views.PersonalMedicalSection
    App.Views.KidsIntroSection
    App.Views.KidsSpouseSection
    App.Views.KidsSupportSection
    App.Views.KidsDisabledSection
    App.Views.AlimonySection
    App.Views.IncomeIntroSection
    App.Views.Form106Section
    App.Views.IncomePensionSection
    App.Views.AuthorSection
    App.Views.BtlSection
    App.Views.StockPreSection
    App.Views.StockSection
    App.Views.StockManualISection
    App.Views.StockManualIISection
    App.Views.StockManualIIISection
    App.Views.StockMiscSection
    App.Views.AppartmentPreSection
    App.Views.AppartmentISection
    App.Views.AppartmentIISection
    App.Views.AppartmentIIISection
    App.Views.LotterySection
    App.Views.OtherSection
    App.Views.EndingSection
  ]

  initialize: ->
    @sections = @sections.map (S) => 
      new S 
        model: @model.get 'request'
        viewModel: @model
    
  changeSection: (section) ->
    @currSection?.collectData()

    if section == 'next' then section = @getNextSection()
    else if section == 'prev' then section = @getPrevSection()
    return unless section? # throw?

    @currSection = section
    @$el.html @currSection.render().el

  hasNext: ->
    @getNextSection()?

  hasPrev: ->
    @getPrevSection()?

  next: ->
    @changeSection 'next'

  prev: ->
    @changeSection 'prev'

  getNextSection: ->
    i = @getCurrIndex() + 1
    i++ while i < @sections.length and not @sections[i].isEnabled()
    @sections[i]

  getPrevSection: ->
    i = @getCurrIndex() - 1
    i-- while i >= 0 and not @sections[i].isEnabled()
    @sections[i]

  getCurrIndex: ->
    @sections.indexOf @currSection


  


