#= require ./section

class App.Views.KidsSection extends App.Views.Section

  getInputKid: (input) ->
    # gets the kid model a certain input belongs to
    index = $(input).closest('[data-index]').data 'index'
    @model.get('kids').findWhere index: index

  collectData: ->
    @$('.kid-data').each (i, input) =>
      kid = @getInputKid(input)
      attr = $(input).attr 'name'
      kid.set attr, @getFieldValue(input)

      console.log "kid#{ kid.get('index') }.set #{ attr }, #{ @getFieldValue input }"

