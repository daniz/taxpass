class App.Views.BtlSection extends App.Views.Section

  id: 'btl-section'
  templateName: 'btl'

  events:
    'change .btl-check'         : 'onCheckboxChange'
    'change .spouse_btl-check'  : 'onSpouseCheckboxChange'

  isEnabled: ->
    @model.get('btl') or @model.get('spouse_btl')

  shouldShowSpouse: ->
    super and @model.get 'spouse_btl'

  initialize: ->
    @forms = @model.get 'btl_forms'

    @listenTo @forms, 
      add     : @onFormAdd
      remove  : @onFormRemove

  onRender: ->
    @forms.each @onFormAdd, this

  getFormContainer: (form) ->
    type = form.get 'type'
    prefix = if form.get('spouse') then 'spouse_' else ''
    ".#{ prefix }btl-form[data-type=#{ type }]"

  onFormAdd: (form) ->
    view = new App.Views.FormUpload
      model           : form
      el              : @getFormContainer(form)
      label           : no
      manualTemplate  : 'btl_manual'
      manualTitle     : 'ביטוח לאומי'
    view.render()

  onFormRemove: (form) ->
    @getFormContainer(form).empty()

  onCheckboxChange: (e) ->
    $target = $(e.currentTarget)
    type    = $target.data 'type'
    checked = $target.prop 'checked'

    if checked
      model = new App.Models.Form type: type
      @forms.add model
    else
      model = @forms.findWhere type: type
      @forms.remove model

  onSpouseCheckboxChange: (e) ->
    $target = $(e.currentTarget)
    type    = $target.data 'type'
    checked = $target.prop 'checked'

    if checked
      model = new App.Models.Form type: type
      @spouseForms.add model
    else
      model = @spouseForms.findWhere type: type
      @spouseForms.remove model
