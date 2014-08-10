#= require ./sections

class App.Views.Editor extends Backbone.View
  el: 'body'

  events:
    'click #continue-button'  : 'onContinueClick'
    'click #back-button'      : 'onBackClick'
    'click #save-button'      : 'onSaveClick'
    'click #mit-only-me'      : 'onOnlyMeClick'
    'click #about'            : 'onAboutClick'
    'click #help'             : 'onHelpClick'
    'click #support'          : 'onSupportClick'
    'change input'            : 'updateNavButtons'

  spouseIncluded: no

  initialize: ->
    @sections = new App.Views.Sections el: '#active-section', model: @model
    @listenTo @sections, 'save', @save

    _.delay @showSupportBalloon, 500
    window.model = @model

  onSaveClick: ->
    currSection = @sections.currSection
    return unless currSection?
    
    currSection.collectData()
    req = @model.get 'request'
    req.set flow: 'save', current_section: currSection.id
    @save()

  save: ->
    json = @serialize()
    @serializeFileInputs()
    console.log JSON.stringify(json)
    @$('#data-input').val JSON.stringify(json)
    @$('#request-form').submit()

  serialize: ->
    json = @model.get('request').toJSON()
    for attr of json
      val = json[attr]
      if val instanceof Backbone.Model or val instanceof Backbone.Collection
        json[attr] = val.toJSON()
    json

  serializeFileInputs: ->
    formsFields = [
      'form106s'
      'form867s'
      'form857s'
      'pension_forms'
      'btl_forms'
      'receipts'
    ]

    for field in formsFields
      forms = @model.get('request').get field
      if forms
        forms.each (form) => @addFileInput form, field
      
  addFileInput: (form, name) ->
    prefix  = if form.get('spouse') then 'spouse_' else ''
    suffix  = "_#{ form.get 'index' }"
    files   = form.get 'files'

    if files?
      $('<input>', type: 'file', name: "#{ prefix }#{ name }#{ suffix }[]", multiple: "multiple")
        .prop('files', files)
        .hide()
        .appendTo @$('#request-form')

  showSupportBalloon: =>
    offset = @$('#support').offset()
    top = offset.top + 40
    left = offset.left - 100
    $balloon = @$('#support-balloon')
    $balloon.css(top: top, left: left).fadeIn 400

    _.delay ( -> $balloon.fadeOut 400), 5000

  render: ->
    @sections.start()
    @updateNavButtons()
  
  getFieldValue: ($input) ->
    if $input.attr('type') is 'checkbox'
      $input.prop 'checked'
    else
      $input.val()

  updateNavButtons: ->
    if @sections.hasNext()
      @$('#continue-button').show()
    else
      @$('#continue-button').text 'סיים'
       
    @$('#back-button').toggle @sections.hasPrev()

    @$('#save-button').toggle @sections.hasNext()

  onContinueClick: ->
    @sections.next()
    @updateNavButtons()

  onBackClick: ->
    @sections.prev()
    @updateNavButtons()

  onOnlyMeClick: ->
    @onContinueClick()

  onAboutClick: ->
    @showDialog 'אודות'
    false

  onHelpClick: ->
    @showDialog 'עזרה'
    false

  onSupportClick: ->
    @showDialog 'תמיכה אנושית'
    false

  showDialog: (text) ->
    App.Dialog.show
      head      : text
      body      : text
      okButton  : 'סבבה'
