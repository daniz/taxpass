class App.Views.AppartmentIIItem extends Backbone.View

  tagName: 'tr'
  className: 'aptii-item'

  events:
    'change .apptii-rented'  : 'onRentedChange'
    'change .appt-data'      : 'onInputChange'
    
  render: ->
    html = JST['appartment_ii_item'].call @, @model.toJSON()
    @$el.html html
    this

  onRentedChange: (e) ->
    checked = $(e.currentTarget).prop 'checked'
    @$('.appt-item-rent').toggle checked

    unless checked
      @model.unset 'months_rent'
      @model.unset 'rent'

  onInputChange: (e) ->
    $t = @$ e.currentTarget
    type = $t.attr 'type'

    val = 
      if type is 'checkbox'
        $t.prop 'checked'
      else if type is 'number'
        parseInt $t.val()

    @model.set $t.attr('name'), val