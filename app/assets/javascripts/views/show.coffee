class App.Show extends Backbone.View

  el: '#content'

  initialize: (o) ->
    @$el.css({direction: 'ltr'})

    _.each @model.toJSON(), (val, attr) =>
      if val?
        @$el.append "#{attr}: #{val}", "<br />"

    if o.kids.length
      @$el.append "<br />"
      @$el.append "---------- kids: "
      @$el.append "<br />"
      _.each o.kids, (k) =>
        @$el.append "<br />"
        _.each k, (val, attr) =>
          if val
            @$el.append "#{attr}: #{val}", "<br />"

    if o.form106s.length
      @$el.append "<br />"
      @$el.append "---------- 106 forms: "
      @$el.append "<br />"
      _.each o.form106s, (f) =>
        @$el.append "<br />"
        _.each f, (val, attr) =>
          if val
            if attr is 'file'
              @$el.append $('<img>', src: val)
            else
              @$el.append "#{attr}: #{val}", "<br />"

    if o.spouseForm106s.length
      @$el.append "<br />"
      @$el.append "---------- spouse 106 forms: "
      @$el.append "<br />"
      _.each o.spouseForm106s, (f) =>
        @$el.append "<br />"
        _.each f, (val, attr) =>
          if val
            @$el.append "#{attr}: #{val}", "<br />"
