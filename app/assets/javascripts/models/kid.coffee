class App.Models.Kid extends Backbone.Model
  index: 1

  defaults:
    under_my_supervision : no

  initialize: ->
    @set 'index', App.Models.Kid::index++