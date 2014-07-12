#= require ./sections

class App.Views.Create extends Backbone.View
  el: 'body'

  events:
    'click #continue-button'  : 'onContinueClick'
    'click #back-button'      : 'onBackClick'
    'click #mit-only-me'      : 'onOnlyMeClick'
    'click #about'            : 'onAboutClick'
    'click #help'             : 'onHelpClick'
    'click #support'          : 'onSupportClick'
    'change input'            : 'updateNavButtons'

  spouseIncluded: no

  initialize: ->
    @sections = new App.Views.Sections el: '#active-section', model: @model

    _.delay @showSupportBalloon, 500

    window.model = @model

  showSupportBalloon: =>
    offset = @$('#support').offset()
    top = offset.top + 40
    left = offset.left - 100
    $balloon = @$('#support-balloon')
    $balloon.css(top: top, left: left).fadeIn 400

    _.delay ( -> $balloon.fadeOut 400), 5000

  render: ->
    @sections.next()
  
  getFieldValue: ($input) ->
    if $input.attr('type') is 'checkbox'
      $input.prop 'checked'
    else
      $input.val()

  updateNavButtons: ->
    # @$('#continue-button').toggle @sections.hasNext()
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

  onSupportClick: ->
    @showDialog 'תמיכה אנושית'
    false

  showDialog: (text) ->
    App.Dialog.show
      head      : text
      body      : text
      okButton  : 'סבבה'
