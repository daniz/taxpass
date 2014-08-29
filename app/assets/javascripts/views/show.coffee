class App.Show extends Backbone.View

  el: '#content'

  append: (o, $parent) ->
    $container = $('<div>').addClass 'show-container'

    for key, val of o
      if _.isArray val
        for x, i in val
          $container.append "<br />"
          $container.append "---------- #{ key } #{ i+1 }: "
          $container.append "<br />" 
          @append x, $container

      else if _.isObject val
        val = if val.toJSON then val.toJSON() else val
        $container.append "<br />"
        $container.append "---------- #{ key }: "
        $container.append "<br />" 
        @append val, $container

      else
        if key is "file"
          $container.append "<a href=#{ val } target=_blank>#{ val }</a>"
          $container.append "<br />"
        else if val?
          $container.append "#{ key }: #{ val }"
          $container.append "<br />"

    $parent.append $container


  initialize: (o) ->
    @$el.css direction: 'ltr'

    @append o, @$el