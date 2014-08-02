class App.Show extends Backbone.View

  el: '#content'

  # appendItem: (model) ->
  #   json = if model.toJSON then model.toJSON() else model
  #   html = JST['show/item'] json
  #   @$el.append html

  # appendArray: (arr, title) ->
  #   if arr?.length
  #     @$el.append "<br />"
  #     @$el.append "---------- #{ title }: "
  #     @$el.append "<br />"
  #     _.each arr, (item) =>
  #       @$el.append "<br />"
  #       @appendItem item

  append: (o, $parent) ->
    $container = $('<div>').addClass 'show-container'

    for key, val of o
      if _.isArray val
        for x, i in val
          $container.append "<br />"
          $container.append "---------- #{ key } #{ i+1 }: "
          $container.append "<br />" 
          @append x, $container

      else if _.isObject val
        val = if val.toJSON then val.toJSON() else val
        $container.append "<br />"
        $container.append "---------- #{ key }: "
        $container.append "<br />" 
        @append val, $container

      else
        if key is "file"
          $container.append "<a href=#{ val } target=_blank>#{ val }</a>"
        else 
          $container.append "#{ key }: #{ val }"
        $container.append "<br />"

    $parent.append $container


  initialize: (o) ->
    @$el.css direction: 'ltr'

    @append o, @$el

    # @appendItem @model

    # @appendArray o.kids, 'kids'
    
    # @appendArray o.form106s, '106 forms'
    # @appendArray o.spouseForm106s, 'spouse 106 forms'
    
    # @appendArray o.form857s, '857 forms'
    # @appendArray o.spouseForm857s, 'spouse 857 forms'
    
    # @appendArray o.btlForms, 'btl forms'
    # @appendArray o.spouseBtlForms, 'spouse btl forms'

    # @appendArray o.pensionForms, 'pension forms'
    # @appendArray o.spousePensionForms, 'spouse pension forms'

    # @appendArray o.form867s, '867 forms'

    # @appendArray o.appartments, 'appartments'

    # @appendArray o.receipts, 'receipts'
    # @appendArray o.spouseReceipts, 'spouse receipts'
    # 