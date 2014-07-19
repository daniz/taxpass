class App.Views.AppartmentIIIItem extends Backbone.View

  tagName: 'tr'
  className: 'aptiii-item'

  events:
    'change .appt-data' : 'onInputChange'
    
  render: ->
    html = JST['appartment_iii_item'].call @, @model.toJSON()
    @$el.html html
    this

  onInputChange: (e) ->
    $t = @$ e.currentTarget
    type = $t.attr 'type'

    val = 
      if type is 'checkbox'
        $t.prop 'checked'
      else if type is 'number'
        parseInt $t.val()

    @model.set $t.attr('name'), val