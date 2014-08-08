
App.help = (templateName, data) ->
  JST["helpers/#{ templateName }"].call @, data  
