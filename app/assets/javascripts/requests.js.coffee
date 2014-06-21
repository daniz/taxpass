class TaxPassView extends Backbone.View
  el: 'body'

  events:
    'click #kds-add-child'    : 'onAddChildClick'
    'click #continue-button'  : 'onContinueClick'
    'change .save-request'    : 'onRequestFieldChange'
    'change .save-kid'        : 'onKidFieldChange'

  initialize: ->
    @kids = new App.Kids
    @model = new Backbone.Model kids: @kids

    @listenTo @kids, 'add', @onKidAdd
    @kids.add {}

    window.view = this

  onKidAdd: (kid) ->
    @addChildField kid

  addChildField: (kid) ->
    html = JST['kid'].call this, kid.toJSON()
    @$('#kds-kids-list').append html

  onContinueClick: (e) ->
    @$('section.is-active').removeClass('is-active')
      .next('section').addClass('is-active')

  onAddChildClick: ->
    @kids.add {}
    false

  onRequestFieldChange: (e) ->
    $input = @$ e.currentTarget
    @model.set $input.attr('id'), $input.val()
    console.log "model.set #{ $input.attr('id') }, #{ $input.val() }"

  onKidFieldChange: (e) ->
    $input = @$ e.currentTarget
    index = $input.closest('[data-index]').data 'index'
    kid = @kids.findWhere index: index
    attr = $input.attr('id').replace /^kid_/, ''
    kid.set attr, $input.val()
    console.log "kid#{index}.set #{ attr }, #{ $input.val() }"


$ -> new TaxPassView