class App.Router extends Backbone.Router

  routes:
    '/'               : 'home'
    'requests'        : 'index'
    'requests/new'    : 'new'
    'requests/:id'    : 'show'

  home: ->
    console.log 'home' # doesnt work

  new: ->
    App.Dialog = new App.Views.Dialog

    model = new Backbone.Model
      request : new App.Models.Request 
        kids            : new App.Collections.Kids
        form106s        : new App.Collections.Form106s
        spouseForm106s  : new App.Collections.Form106s

    window.view = new App.Views.Create model: model
    view.render()

  index: ->
    reqs = new Backbone.Collection gon['requests']
    new App.Index collection: reqs


  show: (id) ->
    model = new App.Models.Request gon['request']
    new App.Show 
      model           : model
      kids            : gon['kids']
      form106s        : gon['form106s']
      spouseForm106s  : gon['spouseForm106s']