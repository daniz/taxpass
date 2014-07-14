
class App.Index extends Backbone.View

  el: '#content'

  initialize: ->
    @$el.css({direction: 'ltr'})

    @collection.each (req) =>
      @$('tbody').append JST['index/request'].call @, req.toJSON()
      