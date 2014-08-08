class App.Models.Request extends Backbone.Model
  
  defaults:
    'tax_year' : (new Date).getFullYear() - 1
    'spouse_name' : 'בן/בת הזוג'

  hasKids: ->
    !!@get('kids')?.length
