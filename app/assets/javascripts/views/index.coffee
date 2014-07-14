
class App.Index extends Backbone.View

  el: '#content'

  initialize: ->
    @$el.css({direction: 'ltr'})

    @collection.each (req) =>
      @$el.append "#{ req.get('id') }"
      @$el.append "<br />"