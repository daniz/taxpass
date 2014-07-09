# require ../kids_section

class App.Views.KidsSupportSection extends App.Views.KidsSection

  id: 'kids-support-section'
  templateName: 'kids_support'

  events:
    'change [name=under_my_supervision]' : 'onSupervisionChange'

  isEnabled: ->
    @model.hasKids()

  onRender: ->
    @model.get('kids').each (kid) =>
      $item = @$ ".kdss-kid-info[data-index=#{ kid.get('index') }]"
      $item.find('.kdss-single-parent').toggle kid.get('under_my_supervision')
      $item.find('.kdss-supported').toggle !kid.get('under_my_supervision')

  onSupervisionChange: (e) ->
    $inp    = @$ e.currentTarget
    $item   = $inp.closest '.kdss-kid-info'
    isUnder = $inp.prop 'checked'

    $item.find('.kdss-single-parent').toggle isUnder
    $item.find('.kdss-supported').toggle !isUnder