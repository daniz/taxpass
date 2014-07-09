class App.Models.Request extends Backbone.Model
  
  defaults:
    'tax_year'      : (new Date).getFullYear() - 1
    'current_user'  : gon['current_user']

  hasKids: ->
    !!@get('kids')?.length