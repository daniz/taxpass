# require ../section
# require ../form_106_upload

class App.Views.Form106Section extends App.Views.Section

  id: 'form-106-section'
  templateName: 'form_106'

  events:
    # 'change #f106-num-workplaces'         : 'onNumWorkplacesChange'
    # 'change #spouse_f106-num-workplaces'  : 'onSpouseNumWorkplacesChange'
    # 'click .f106-upload-button'         : 'onUploadClick'
    # 'click .f106-manual-button'         : 'onManualClick'
    'click #f106-add-workplace'         : 'onAddWorkplaceClick'  
    'click #spouse_f106-add-workplace'  : 'onAddSpouseWorkplaceClick'  

  initialize: ->
    @forms = @model.get 'form106s'
    @spouseForms = @model.get 'spouseForm106s'

    @listenTo @forms, 'add', @onFormAdd
    @listenTo @spouseForms, 'add', @onSpouseFormAdd

  isEnabled: ->
    @model.get 'employed'

  onRender: ->
    # maybe add 1 empty workplace

  onAddWorkplaceClick: ->
    @forms.add {}
    false

  onAddSpouseWorkplaceClick: ->
    @spouseForms.add {}
    false

  onFormAdd: (form) ->
    view = new App.Views.Form106Upload model: form, spouse: no
    @$('#f106-workplaces').append view.render().el


  # createWorkplaceField: (o) ->
  #   JST['form_106_upload'].call @,
  #     index   : o.index
  #     prefix  : if o.spouse then 'spouse_' else ''
  #     model   : o.form

  # onFormAdd: (form) ->
  #   field = @createWorkplaceField   
  #     index   : form.get('index')
  #     spouse  : no
  #     form    : form

  #   @$('#f106-workplaces').append field

  # onSpouseFormAdd: (form) ->
  #   field = @createWorkplaceField   
  #     index   : form.get('index')
  #     spouse  : yes
  #     form    : form

  #   @$('#spouse_f106-workplaces').append field


  # handleNumWorkplacesChange: (e, o) ->
  #   if o.spouse
  #     prefix = 'spouse_'
  #     forms = @spouseForms
  #     $list = @$ '#spouse_f106-workplaces'
  #   else
  #     prefix = ''
  #     forms = @forms
  #     $list = @$ '#f106-workplaces'

  #   window.forms = forms

  #   num = parseInt $(e.currentTarget).val()

  #   fields = for i in [1..num]
  #     JST['form_106_upload'].call @, index: i, prefix: prefix
  #   $list.html fields

  #   toAdd = num - forms.length
  #   length = forms.length

  #   if toAdd > 0
  #     for i in [forms.length + 1..num]
  #       forms.add new Backbone.Model(index: i)
  #   else
  #     toRemove = -toAdd
  #     _(toRemove).times ->
  #       forms.remove forms.last()

  # onNumWorkplacesChange: (e) ->
  #   @handleNumWorkplacesChange e, spouse: no

  # onSpouseNumWorkplacesChange: (e) ->
  #   @handleNumWorkplacesChange e, spouse: yes

  # onUploadClick: (e) ->
  #   @$(e.currentTarget).siblings('[type=file]').click()

  