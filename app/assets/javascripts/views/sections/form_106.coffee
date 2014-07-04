# require ../section

class App.Views.Form106Section extends App.Views.Section

  id: 'form-106-section'
  templateName: 'form_106'

  events:
    'change #f106-num-workplaces'         : 'onNumWorkplacesChange'
    'change #spouse_f106-num-workplaces'  : 'onSpouseNumWorkplacesChange'
    'click .f106-upload-button'           : 'onUploadClick'
    'click .f106-manual-button'           : 'onManualClick'

  initialize: ->
    @forms = @model.get 'form106s'
    @spouseForms = @model.get 'spouseForm106s'

  isEnabled: ->
    @model.get 'employed'

  render: ->
    super
    @$('#f106-num-workplaces, #spouse_f106-num-workplaces').trigger 'change'
    this

  handleNumWorkplacesChange: (e, o) ->
    if o.spouse
      prefix = 'spouse_'
      forms = @spouseForms
      $list = @$ '#spouse_f106-workplaces'
    else
      prefix = ''
      forms = @forms
      $list = @$ '#f106-workplaces'

    window.forms = forms

    num = parseInt $(e.currentTarget).val()

    fields = for i in [1..num]
      JST['form_106_upload'].call @, index: i, prefix: prefix
    $list.html fields

    toAdd = num - forms.length
    length = forms.length

    if toAdd > 0
      for i in [forms.length + 1..num]
        forms.add new Backbone.Model(index: i)
    else
      toRemove = -toAdd
      _(toRemove).times ->
        forms.remove forms.last()

  onNumWorkplacesChange: (e) ->
    @handleNumWorkplacesChange e, spouse: no

  onSpouseNumWorkplacesChange: (e) ->
    @handleNumWorkplacesChange e, spouse: yes

  onUploadClick: (e) ->
    @$(e.currentTarget).siblings('[type=file]').click()

  onManualClick: (e) ->
    $t = @$ e.currentTarget
    index = $t.data 'index'
    prefix = $t.data 'prefix'

    templateData =
      index   : index
      prefix  : prefix

    forms = if prefix then @spouseForms else @forms

    html = JST['form_106_manual'].call @, templateData
    $('#dialog-head').text 'טופס 106'
    $('#dialog-body').html html
    $('#dialog-ok-button').text 'סיימתי'
    $('#dialog').css top: 50
    $('#dialog-dim').fadeIn 200

    $('#dialog-ok-button').one 'click', =>
      form106Model = forms.findWhere index: index
      form106Model.set
        'field_158' : $('.form_106_field_158').val()
        'field_244' : $('.form_106_field_244').val()
        'field_248' : $('.form_106_field_248').val()
        'field_042' : $('.form_106_field_042').val()
        'field_045' : $('.form_106_field_045').val()
        'field_011' : $('.form_106_field_011').val()

      console.log form106Model