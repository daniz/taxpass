# require ../section

class App.Views.KidsSection extends App.Views.Section

  id: 'kids-section'
  templateName: 'kids'

  events:
    'change #kds-has-kids'  : 'onHasKidsChange'
    'click #kds-add-kid'    : 'onAddKidClick'

  onHasKidsChange: (e) ->    
    hasKids = @$(e.currentTarget).prop 'checked'
    @$('#kds-kids').toggle hasKids

  onAddKidClick: ->
    @model.get('kids').add {}
    false

