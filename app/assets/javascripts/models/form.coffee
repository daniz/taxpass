class App.Models.Form extends Backbone.Model
  index: 1

  initialize: ->
    @set 'index', App.Models.Form::index++

  toJSON: ->
    _.omit super, 'files'