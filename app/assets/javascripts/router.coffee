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
        form106s        : new App.Collections.Forms
        form867s        : new App.Collections.Forms
        form857s        : new App.Collections.Forms
        pension_forms   : new App.Collections.Forms
        btl_forms       : new App.Collections.Forms
        
    window.view = new App.Views.Create model: model
    view.render()

  index: ->
    reqs = new Backbone.Collection gon['requests']
    new App.Index collection: reqs


  show: (id) ->
    model = new App.Models.Request gon['request']
    new App.Show _.extend { model: model }, _.omit(gon, 'request')