class App.Models.Kid extends Backbone.Model
  index: 1

  initialize: ->
    @set 'index', App.Models.Kid::index++