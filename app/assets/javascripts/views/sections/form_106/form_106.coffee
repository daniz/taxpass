# require ./form_106_upload

class App.Views.Form106Section extends App.Views.Section

  id: 'form-106-section'
  templateName: 'form_106'

  events:
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

  onSpouseFormAdd: (form) ->
    view = new App.Views.Form106Upload model: form, spouse: yes
    @$('#spouse_f106-workplaces').append view.render().el