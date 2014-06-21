class App.Kid extends Backbone.Model
  index: 1

  initialize: ->
    @set 'index', App.Kid::index++