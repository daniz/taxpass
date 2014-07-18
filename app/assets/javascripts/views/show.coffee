class App.Show extends Backbone.View

  el: '#content'

  appendItem: (model) ->
    json = if model.toJSON then model.toJSON() else model
    html = JST['show/item'] json
    @$el.append html

  appendArray: (arr, title) ->
    if arr?.length
      @$el.append "<br />"
      @$el.append "---------- #{ title }: "
      @$el.append "<br />"
      _.each arr, (item) =>
        @$el.append "<br />"
        @appendItem item    

  initialize: (o) ->
    @$el.css({direction: 'ltr'})

    @appendItem @model

    @appendArray o.kids, 'kids'
    
    @appendArray o.form106s, '106 forms'
    @appendArray o.spouseForm106s, 'spouse 106 forms'
    
    @appendArray o.form857s, '857 forms'
    @appendArray o.spouseForm857s, 'spouse 857 forms'
    
    @appendArray o.btlForms, 'btl forms'
    @appendArray o.spouseBtlForms, 'spouse btl forms'
    

    # if o.kids.length
    #   @$el.append "<br />"
    #   @$el.append "---------- kids: "
    #   @$el.append "<br />"
    #   _.each o.kids, (k) =>
    #     @$el.append "<br />"
    #     @appendItem k
        
    # if o.form106s.length
    #   @$el.append "<br />"
    #   @$el.append "---------- 106 forms: "
    #   @$el.append "<br />"
    #   _.each o.form106s, (f) =>
    #     @$el.append "<br />"
    #     @appendItem f
        
    # if o.spouseForm106s.length
    #   @$el.append "<br />"
    #   @$el.append "---------- spouse 106 forms: "
    #   @$el.append "<br />"
    #   _.each o.spouseForm106s, (f) =>
    #     @$el.append "<br />"
    #     @appendItem f
    #     