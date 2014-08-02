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
      manualTitle  : 'ביטוח לאומי'
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
      manualTitle  : 'ביטוח לאומי'
    view.render()

  onSpouseFormRemove: (form) ->
    @$(".spouse_btl-form[data-type=#{ form.get 'type' }]").empty()

  onCheckboxChange: (e) ->
    $target = $(e.currentTarget)
    type = $target.data 'type'
    checked = $target.prop 'checked'

    if checked
      model = new App.Models.Form type: type
      @forms.add model
    else
      model = @forms.findWhere type: type
      @forms.remove model

  onSpouseCheckboxChange: (e) ->
    $target = $(e.currentTarget)
    type = $target.data 'type'
    checked = $target.prop 'checked'

    if checked
      model = new App.Models.Form type: type
      @spouseForms.add model
    else
      model = @spouseForms.findWhere type: type
      @spouseForms.remove model