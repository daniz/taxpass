#= require ./sections

class TaxPassView extends Backbone.View
  el: 'body'

  events:
    'click #continue-button'  : 'onContinueClick'
    'click #back-button'      : 'onBackClick'
    
    'click #mit-only-me'      : 'onOnlyMeClick'

    'click #about'            : 'onAboutClick'
    'click #help'             : 'onHelpClick'
    'click #instructions'     : 'onInstructionClick'
    'click #dialog-ok-button' : 'onDialogOkClick'

  
  spouseIncluded: no

  initialize: ->
    @kids = new App.Collections.Kids
    @form106s = new App.Collections.Form106s
    @spouseForm106s = new App.Collections.Form106s
    @model = new App.Models.Request 
      kids            : @kids
      form106s        : @form106s
      spouseForm106s  : @spouseForm106s

    @sections = new App.Views.Sections el: '#active-section', model: @model

    window.model = @model
    
  render: ->
    @sections.next()
  
  getFieldValue: ($input) ->
    if $input.attr('type') is 'checkbox'
      $input.prop 'checked'
    else
      $input.val()

  updateNavButtons: ->
    @$('#continue-button').toggle @sections.hasNext()
    @$('#back-button').toggle @sections.hasPrev()

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
  
  onInstructionClick: ->
    @showDialog 'אז איך זה עובד?'
    false

  showDialog: (text) ->
    $('#dialog').css top: 200
    $('#dialog-head').text text
    $('#dialog-body').text text
    $('#dialog-ok-button').text 'סבבה'
    $('#dialog-dim').fadeIn 200

  onDialogOkClick: ->
    $('#dialog-dim').fadeOut 200
    

$ -> 
  window.view = new TaxPassView
  view.render()