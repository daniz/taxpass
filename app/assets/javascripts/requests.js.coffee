class TaxPassView extends Backbone.View
  el: 'body'

  events:
    'click #kds-add-Kid'      : 'onAddKidClick'
    'click #continue-button'  : 'onContinueClick'
    'click #back-button'      : 'onBackClick'
    'change .save-request'    : 'onRequestFieldChange'
    'change .save-kid'        : 'onKidFieldChange'

  initialize: ->
    @kids = new App.Kids
    @model = new Backbone.Model kids: @kids

    @listenTo @kids, 'add', @onKidAdd
    @listenTo @model, 'change', @onModelChange    

    @kids.add {}

  getFieldValue: (input) ->
    $input = $ input
    if $input.attr('type') is 'checkbox'
      $input.prop 'checked'
    else
      $input.val()
  
  addKidField: (kid) ->
    html = JST['kid'].call @, kid.toJSON()
    @$('#kds-kids-list').append html

  addKidSupportField: (kid) ->
    html = JST['kid_support'].call @, kid.toJSON()
    @$('#kdss-kids-list').append html

  onKidAdd: (kid) ->
    @addKidField kid
    @addKidSupportField kid

  onContinueClick: (e) ->
    m = @model.toJSON()
      
    @$('#widowed-intro-section').toggleClass 'disabled', !m.is_widowed
    @$('#married-intro-section').toggleClass 'disabled', !!m.is_widowed or !m.is_married

    @$('section.active').removeClass('active')
      .nextAll('section:not(.disabled)').first().addClass('active')

  onBackClick: (e) ->
    $current = @$('section.active')
    $prev = $current.prevAll('section:not(.disabled)').first()

    if $prev.length
      $current.removeClass('active')
      $prev.addClass('active')

  onAddKidClick: ->
    @kids.add {}
    false

  onRequestFieldChange: (e) ->
    $input = @$ e.currentTarget
    @model.set $input.attr('id'), @getFieldValue $input

    console.log "model.set #{ $input.attr('id') }, #{ @getFieldValue $input }"

  onKidFieldChange: (e) ->
    $input = @$ e.currentTarget
    index = $input.closest('[data-index]').data 'index'
    kid = @kids.findWhere index: index
    attr = $input.attr('id').replace /^kid_/, ''
    kid.set attr, @getFieldValue $input

    console.log "kid#{index}.set #{ attr }, #{ @getFieldValue $input }"

  onModelChange: ->
    attrs = @model.changedAttributes()

    if attrs['tax_year']?
      @$('.tax-year').text attrs['tax_year']


$ -> new TaxPassView