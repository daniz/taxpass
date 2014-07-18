
class App.Views.Dialog extends Backbone.View

  el: '#dialog-dim'

  events: ->
    'click #dialog-ok-button' : 'onOkButtonClick'

  show: (o) ->
    o = _.defaults o,
      head      : ''
      body      : ''
      okButton  : 'סיום'
      top       : 150

    @$('#dialog-head').text o.head
    @$('#dialog-body').html o.body
    @$('#dialog-ok-button').text o.okButton
    @$('#dialog').css top: o.top
    @$el.fadeIn 200
    this

  hide: ->
    @$el.fadeOut 200
    this

  onOkButtonClick: ->
    @hide().trigger 'ok'
    false
