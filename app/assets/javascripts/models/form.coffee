class App.Models.Form extends Backbone.Model
  toJSON: ->
    _.omit super, 'files'