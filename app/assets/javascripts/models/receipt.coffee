class App.Models.Receipt extends Backbone.Model
  index: 1

  initialize: ->
    @set 'index', App.Models.Receipt::index++

  toJSON: ->
    _.omit super, 'files'