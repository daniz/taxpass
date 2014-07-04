#= require ./sections

class TaxPassView extends Backbone.View
  el: 'body'

  events:
    # 'click #kds-add-kid'      : 'onAddKidClick'
    'click #continue-button'  : 'onContinueClick'
    'click #back-button'      : 'onBackClick'
    # 'change .request-data'    : 'onRequestFieldChange'
    'change .save-kid'        : 'onKidFieldChange'
    'click #mit-only-me'      : 'onOnlyMeClick'
    'click #mit-spouse-too'   : 'onSpouseTooClick'
    # 'change #kds-has-kids'    : 'onHasKidsChange'

    'click #about'            : 'onAboutClick'
    'click #help'             : 'onHelpClick'
    'click #instructions'     : 'onInstructionClick'
    'click #dialog-ok-button' : 'onDialogOkClick'

  
  spouseIncluded: no

  initialize: ->
    @kids = new App.Collections.Kids
    @form106s = new App.Collections.Form106s
    @model = new App.Models.Request 
      kids        : @kids
      form106s    : @form106s
      spouseForm  : @spouseForm106s

    @listenTo @kids, 'add', @onKidAdd
    # @listenTo @model, 'change', @onModelChange

    @sections = new App.Views.Sections el: '#active-section', model: @model

    window.model = @model
    
  render: ->
    @sections.next()
  
  addKidField: (kid) ->
    html = JST['kid'].call @, kid.toJSON()
    @$('#kds-kids-list').append html

  addKidSupportField: (kid) ->
    $html = $ JST['kid_support'].call(@, kid.toJSON())
    @$('#kdss-kids-list').append $html

    kid.on 'change:name', -> $html.find('.kdss-kid-name').text kid.get('name')

  getFieldValue: ($input) ->
    if $input.attr('type') is 'checkbox'
      $input.prop 'checked'
    else
      $input.val()

  onKidAdd: (kid) ->
    console.log 'kidadd'
    @addKidField kid
    @addKidSupportField kid

  onContinueClick: ->
    m = @model.toJSON()
    @sections.next()

  onBackClick: ->
    # $current = @$('section.active')
    # $prev = $current.prevAll('section:not(.disabled)').first()

    # if $prev.is '#tax-year-section'
    #   @$('#back-button').hide()

    # @$('#continue-button').show()

    # if $prev.length
    #   $current.removeClass('active')
    #   $prev.addClass('active')

    @sections.prev()

  onKidFieldChange: (e) ->
    $input = @$ e.currentTarget
    index = $input.closest('[data-index]').data 'index'
    kid = @kids.findWhere index: index
    attr = $input.attr('id').replace(/^kid_/, '').replace /_[0-9]*$/, ''
    kid.set attr, @getFieldValue $input

    console.log "kid#{index}.set #{ attr }, #{ @getFieldValue $input }"

  onOnlyMeClick: ->
    @onContinueClick()

  onHasKidsChange: (e) ->
    # hasKids = @$(e.currentTarget).prop 'checked'
    # @$('#kds-kids').toggle hasKids
    # @$('#kids-support-section').toggleClass 'disabled', !hasKids

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