class App.Models.Request extends Backbone.Model
  
  defaults:
    'tax_year' : (new Date).getFullYear() - 1

  hasKids: ->
    !!@get('kids')?.length
