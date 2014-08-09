class App.Router extends Backbone.Router

  routes:
    '/'                 : 'home'
    'requests'          : 'index'
    'requests/new'      : 'new'
    'requests/:id'      : 'show'
    'requests/:id/edit' : 'edit'

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
        
    window.view = new App.Views.Editor model: model
    view.render()

  edit: (id) ->
    App.Dialog = new App.Views.Dialog

    model = new App.Models.Request
      request : new App.Models.Request _.extend gon.request,
        kids            : new App.Collections.Kids gon.kids
        form106s        : new App.Collections.Forms gon.forms.form106s
        form867s        : new App.Collections.Forms gon.forms.form867s
        form857s        : new App.Collections.Forms gon.forms.form857s
        pension_forms   : new App.Collections.Forms gon.forms.pension_forms
        btl_forms       : new App.Collections.Forms gon.forms.btl_forms

    window.view = new App.Views.Editor model: model
    view.render()

  index: ->
    reqs = new Backbone.Collection gon['requests']
    new App.Index collection: reqs

  show: (id) ->
    model = new App.Models.Request gon.request
    new App.Show _.extend { model: model }, _.omit(gon, 'request')