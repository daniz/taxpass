class App.Views.AppartmentIDetails extends Backbone.View

  className: 'apti-details-item'

  events:
    'change [name=name]' : 'onNameChange'
    'change [type=radio]' : 'onOwnershipChange'

  render: ->
    html = JST['appartment_i_details'].call @, @model.toJSON()
    @$el.html html
    this

  onNameChange: (e) ->
    @model.set 'name', $(e.currentTarget).val()

  onOwnershipChange: (e) ->
    $t = $(e.currentTarget)
    @model.set 'ownership', 
      if $t is '.appt-ownership-mine' then 1
      else if $t.is '.appt-ownership-spouse' then 2
      else if $t.is '.appt-ownership-shared' then 3