# require ../section

class App.Views.KidsSupportSection extends App.Views.Section

  id: 'kids-support-section'
  templateName: 'kids_support'

  isEnabled: ->
    !!@model.get('kids')?.length

  render: ->
    super
    @model.get('kids').each (kid) =>
      $html = $ JST['kid_support'].call(@, kid.toJSON())
      @$('#kdss-kids-list').append $html

    this
