# require ../kids_section

class App.Views.KidsIntroSection extends App.Views.KidsSection

  id: 'kids-intro-section'
  templateName: 'kids_intro'

  events:
    'change #kds-has-kids'  : 'toggleKidFields'
    'click #kds-add-kid'    : 'onAddKidClick'

  initialize: ->
    @kids = @model.get 'kids'
    @listenTo @kids, 'add', @addKidField

  onRender: ->
    @toggleKidFields()

  onAddKidClick: ->
    @model.get('kids').add {}
    false

  addKidField: (kid) ->
    html = JST['kid'].call @, kid.toJSON()
    @$('#kds-kids-list').append html

  toggleKidFields: ->
    @$('#kds-kids').toggle @getHasKids()

  getHasKids: ->
    @$('#kds-has-kids').prop 'checked'

  collectData: ->
    if @getHasKids() then super
    else @kids.reset()

