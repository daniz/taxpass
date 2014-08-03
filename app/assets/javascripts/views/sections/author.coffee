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
    @forms = @model.get 'form857s'
    @listenTo @forms, 
      add     : @onFormAdd
      remove  : @onFormRemove

  getFormContainer: (form) ->
    if form.get('spouse') then @$('#spouse_ath-857-form') else @$('#ath-857-form')

  onFormAdd: (form) ->
    o = 
      model             : form
      el                : @getFormContainer(form)
      label             : no
      manualTemplate    : 'author_manual'
      manualTitle       : 'טופס 857'

    new App.Views.FormUpload(o).render()

  onFormRemove: (form) ->
    @getFormContainer(form).empty()

  onProfessionChange: (e) ->
    checked = @$(e.currentTarget).prop 'checked'
    form = @forms.findWhere spouse: no
    if checked
      unless form
        @forms.add(new App.Models.Form spouse: no)
    else
      @forms.remove form
    
  onSpouseProfessionChange: (e) ->
    checked = @$(e.currentTarget).prop 'checked'
    form = @forms.findWhere spouse: yes
    if checked
      unless form
        @forms.add(new App.Models.Form spouse: yes)
    else
      @forms.remove form
    
  onOtherChange: (e) ->
    checked = @$(e.currentTarget).prop 'checked'
    @$('#ath-other-text').toggle checked

  onSpouseOtherChange: (e) ->
    checked = @$(e.currentTarget).prop 'checked'
    @$('#spouse_ath-other-text').toggle checked



