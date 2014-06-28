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
    @model = new App.Models.Request kids: @kids

    @listenTo @kids, 'add', @onKidAdd
    # @listenTo @model, 'change', @onModelChange

    @sections = new App.Views.Sections el: '#active-section', model: @model

    window.model = @model

    
  render: ->
    @sections.next()
    # @$('#tax_year').trigger 'change'
    # @kids.add {}

  # setResidenceDates: ->
  #   yyyy = @model.get 'tax_year'
    
  #   @$('#special_area_residency_start_date').val "#{ yyyy }-01-01"
  #   @$('#special_area_residency_end_date').val "#{ yyyy }-12-31"

  # getFieldValue: (input) ->
  #   $input = $ input
  #   if $input.attr('type') is 'checkbox'
  #     $input.prop 'checked'
  #   else
  #     $input.val()
  
  addKidField: (kid) ->
    html = JST['kid'].call @, kid.toJSON()
    @$('#kds-kids-list').append html

  addKidSupportField: (kid) ->
    $html = $ JST['kid_support'].call(@, kid.toJSON())
    @$('#kdss-kids-list').append $html

    kid.on 'change:name', -> $html.find('.kdss-kid-name').text kid.get('name')

  onKidAdd: (kid) ->
    console.log 'kidadd'
    @addKidField kid
    @addKidSupportField kid

  onContinueClick: ->
    m = @model.toJSON()
      
    # @$('#widowed-intro-section').toggleClass 'disabled', !m.is_widowed
    # @$('#married-intro-section').toggleClass 'disabled', !!m.is_widowed or !m.is_married
    # @$('#academia-section').toggleClass 'disabled', !m.academic and !m.spouse_academic
    # @$('#special-area-section').toggleClass 'disabled', !m.special_area_resident and !m.spouse_special_area_resident
    # @$('#kids-spouse-section').toggleClass 'disabled', !m.is_married

    # @$('#back-button').show()

    # $current = @$('section.active')
    # $next = $current.nextAll('section:not(.disabled)').first()

    # if $next.is '#under-construction-section'
    #   @$('#continue-button').hide()

    # $current.removeClass('active')
    # $next.addClass('active')

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

  # onAddKidClick: ->
  #   @kids.add {}
  #   false

  # onRequestFieldChange: (e) ->
  #   $input = @$ e.currentTarget
  #   @model.set $input.attr('id'), @getFieldValue $input

  #   console.log "model.set #{ $input.attr('id') }, #{ @getFieldValue $input }"

  onKidFieldChange: (e) ->
    $input = @$ e.currentTarget
    index = $input.closest('[data-index]').data 'index'
    kid = @kids.findWhere index: index
    attr = $input.attr('id').replace(/^kid_/, '').replace /_[0-9]*$/, ''
    kid.set attr, @getFieldValue $input

    console.log "kid#{index}.set #{ attr }, #{ @getFieldValue $input }"

  # onModelChange: ->
  #   attrs = @model.changedAttributes()

  #   if attrs['tax_year']?
  #     @$('.tax-year').text attrs['tax_year']
  #     # @setResidenceDates()

  #   if attrs['spouse_name']?
  #     @$('.spouse-name').text attrs['spouse_name']

  #   if attrs['deceased_spouse_name']?
  #     @$('.spouse-name').text attrs['deceased_spouse_name']


  onOnlyMeClick: ->
    @onContinueClick()

  # onSpouseTooClick: ->
  #   @spouseIncluded = yes
  #   @$('#mit-only-me, #mit-spouse-too').hide()

  #   @$el.addClass 'spouse-included'

  onHasKidsChange: (e) ->
    # hasKids = @$(e.currentTarget).prop 'checked'
    # @$('#kds-kids').toggle hasKids
    # @$('#kids-support-section').toggleClass 'disabled', !hasKids

  onAboutClick: ->
    $('#dialog-head').text 'אודות'
    $('#dialog-dim').fadeIn 200
    false

  onHelpClick: ->
    $('#dialog-head').text 'עזרה'
    $('#dialog-dim').fadeIn 200
    false
  
  onInstructionClick: ->
    $('#dialog-head').text 'איך זה עובד?'
    $('#dialog-dim').fadeIn 200
    false

  onDialogOkClick: ->
    $('#dialog-dim').fadeOut 200
    

$ -> 
  window.view = new TaxPassView
  view.render()