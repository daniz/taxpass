# require ./form_106_upload

class App.Views.Form106Section extends App.Views.Section

  id: 'form-106-section'
  templateName: 'form_106'

  events:
    'click #f106-add-workplace'         : 'onAddWorkplaceClick'  
    'click #spouse_f106-add-workplace'  : 'onAddSpouseWorkplaceClick'  

  initialize: ->
    @forms = @model.get 'form106s'
    @listenTo @forms, 'add', @addForm

  isEnabled: ->
    @model.get('employed') or @model.get('spouse_employed')

  shouldShowSpouse: ->
    super and @model.get 'spouse_employed'

  onRender: ->
    @forms.each @addForm, this

  onAddWorkplaceClick: ->
    @forms.add spouse: no
    false

  onAddSpouseWorkplaceClick: ->
    @forms.add spouse: yes
    false

  addForm: (form) ->
    spouse = form.get "spouse"
    workplaceAttr = "#{ if spouse then 'spouse_' else '' }workplace"

    view = new App.Views.FormUpload
      model           : form
      manualTemplate  : 'form_106_manual'
      manualTitle     : 'טופס 106'
      label           : 
        text          : 'מקום עבודה'
        name          : workplaceAttr
        value         : form.get(workplaceAttr)
    view.render()

    $container =
      if spouse then @$('#spouse_f106-workplaces')
      else @$('#f106-workplaces')
    
    $container.append view.el