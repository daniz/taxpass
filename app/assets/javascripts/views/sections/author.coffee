class App.Views.AuthorSection extends App.Views.Section

  id: 'author-section'
  templateName: 'author'

  events:
    'change #ath-profession'        : 'onProfessionChange'
    'change #spouse_ath-profession' : 'onSpouseProfessionChange'
    'change #ath-other'             : 'onOtherChange'
    'change #spouse_ath-other'      : 'onSpouseOtherChange'


  isEnabled: ->
    @model.get 'author'

  initialize: ->
    @listenTo @model, 'change:form857', @onForm857Change
    @listenTo @model, 'change:spouseForm857', @onSpouseForm857Change

  onForm857Change: (model, form857) ->
    @_formChangeHandler '#ath-857-form', form857

  onSpouseForm857Change: (model, spouseForm857) ->
    @_formChangeHandler '#spouse_ath-857-form', spouseForm857

  _formChangeHandler: (el, formModel) ->
    if formModel
      o = 
        model             : formModel
        el                : el
        fileInputClass    : '857_file'
        uploadButtonLabel : 'העלה קובץ 857'
        manualButtonLabel : 'הזן ידנית'
        template          : 'author_upload'
        manualTemplate    : 'author_manual'
        manualDialogHead  : 'טופס 857'

      new App.Views.FormUpload(o).render()

    else @$(el).empty()

  onProfessionChange: (e) ->
    checked = @$(e.currentTarget).prop 'checked'
    @model.set 'form857', 
      if checked then new Backbone.Model else false

  onSpouseProfessionChange: (e) ->
    checked = @$(e.currentTarget).prop 'checked'
    @model.set 'spouseForm857', 
      if checked then new Backbone.Model else false

  onOtherChange: (e) ->
    checked = @$(e.currentTarget).prop 'checked'
    @$('#ath-other-text').toggle checked

  onSpouseOtherChange: (e) ->
    checked = @$(e.currentTarget).prop 'checked'
    @$('#spouse_ath-other-text').toggle checked



