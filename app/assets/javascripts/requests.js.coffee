class TaxPassView extends Backbone.View
  el: 'body'

  events:
    'click #continue-button': 'onContinueClick'
    'click #kds-add-child': 'onAddChildClick'

  initialize: ->
    @render()
  
  render: ->
    @addChildField()

  addChildField: ->
    index = @$('.kds-kid-info:last').data('index') + 1
    html = JST['kid'](index: index ? 0)
    @$('#kds-kids-list').append html

  onContinueClick: (e) ->
    @$('section.is-active').removeClass('is-active')
      .next('section').addClass('is-active')

  onAddChildClick: ->
    @addChildField()
    false



$ -> new TaxPassView