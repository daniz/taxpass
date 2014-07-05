# require ../section

class App.Views.KidsSection extends App.Views.Section

  id: 'kids-section'
  templateName: 'kids'

  events:
    'change #kds-has-kids'  : 'onHasKidsChange'
    'click #kds-add-kid'    : 'onAddKidClick'
    'change .save-kid'      : 'onKidFieldChange'

  initialize: ->
    @kids = @model.get 'kids'
    @listenTo @kids, 'add', @addKidField

  addKidField: (kid) ->
    html = JST['kid'].call @, kid.toJSON()
    @$('#kds-kids-list').append html

  onHasKidsChange: (e) ->    
    hasKids = @$(e.currentTarget).prop 'checked'
    @$('#kds-kids').toggle hasKids

  onAddKidClick: ->
    @model.get('kids').add {}
    false

  onKidFieldChange: (e) ->
    $input = @$ e.currentTarget
    index = $input.closest('[data-index]').data 'index'
    kid = @kids.findWhere index: index
    attr = $input.attr('id').replace(/^kid_/, '').replace /_[0-9]*$/, ''
    kid.set attr, @getFieldValue $input

    console.log "kid#{index}.set #{ attr }, #{ @getFieldValue $input }"

