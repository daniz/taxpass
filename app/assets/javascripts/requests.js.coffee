class TaxPassView extends Backbone.View
  el: 'body'

  events:
    'click #continue-button': 'onContinueClick'

  onContinueClick: (e) ->
    @$('section.is-active').removeClass('is-active')
      .next('section').addClass('is-active')

$ ->
  new TaxPassView