class App.Views.BtlSection extends App.Views.Section

  id: 'btl-section'
  templateName: 'btl'

  events:
    'change .btl-check'         : 'onCheckboxChange'
    'change .spouse_btl-check'  : 'onSpouseCheckboxChange'

  isEnabled: ->
    @model.get 'btl'

  initialize: ->
    @forms = @model.get 'btlForms'
    @spouseForms = @model.get 'spouseBtlForms'

    @listenTo @forms, 'add', @onFormAdd
    @listenTo @spouseForms, 'add', @onSpouseFormAdd

    @listenTo @forms, 'remove', @onFormRemove
    @listenTo @spouseForms, 'remove', @onSpouseFormRemove

  onFormAdd: (form) ->
    type = form.get 'type'
    view = new App.Views.FormUpload
      model             : form
      el                : ".btl-form[data-type=#{ type }]"
      fileInputClass    : 'btl_file_#{ type }'
      uploadButtonLabel : 'סרוק את הטופס'
      manualButtonLabel : 'הקלד'
      template          : 'form_upload'
      manualTemplate    : 'btl_manual'
      manualDialogHead  : 'ביטוח לאומי'
    view.render()

  onFormRemove: (form) ->
    @$(".btl-form[data-type=#{ form.get 'type' }]").empty()

  onSpouseFormAdd: (form) ->
    type = form.get 'type'
    view = new App.Views.FormUpload
      model             : form
      el                : ".spouse_btl-form[data-type=#{ type }]"
      fileInputClass    : 'spouse_btl_file_#{ type }'
      uploadButtonLabel : 'סרוק את הטופס'
      manualButtonLabel : 'הקלד'
      template          : 'form_upload'
      manualTemplate    : 'btl_manual'
      manualDialogHead  : 'ביטוח לאומי'
    view.render()

  onSpouseFormRemove: (form) ->
    @$(".spouse_btl-form[data-type=#{ form.get 'type' }]").empty()

  onCheckboxChange: (e) ->
    $target = $(e.currentTarget)
    type = $target.data 'type'
    checked = $target.prop 'checked'

    if checked
      model = new Backbone.Model type: type
      @forms.add model
    else
      model = @forms.findWhere type: type
      @forms.remove model

  onSpouseCheckboxChange: (e) ->
    $target = $(e.currentTarget)
    type = $target.data 'type'
    checked = $target.prop 'checked'

    if checked
      model = new Backbone.Model type: type
      @spouseForms.add model
    else
      model = @spouseForms.findWhere type: type
      @spouseForms.remove model



  # onForm857Change: (model, form857) ->
  #   @_formChangeHandler '#ath-857-form', form857

  # onSpouseForm857Change: (model, spouseForm857) ->
  #   @_formChangeHandler '#spouse_ath-857-form', spouseForm857

  # _formChangeHandler: (el, formModel) ->
  #   if formModel
  #     o = 
  #       model             : formModel
  #       el                : el
  #       fileInputClass    : '857_file'
  #       uploadButtonLabel : 'העלה קובץ 857'
  #       manualButtonLabel : 'הזן ידנית'
  #       template          : 'author_upload'
  #       manualTemplate    : 'author_manual'
  #       manualDialogHead  : 'טופס 857'

  #     new App.Views.FormUpload(o).render()

  #   else @$(el).empty()

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



