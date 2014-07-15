
class App.Views.Form106Upload extends App.Views.FormUpload

  tagName: 'li'

  events: ->
    _.extend App.Views.FormUpload::events, 
      'change .workplace' : 'onWorkplaceChange'
    
  options:
      template          : 'form_106_upload'
      manualTemplate    : 'form_106_manual'
      manualDialogHead  : 'טופס 106'

  onWorkplaceChange: ->
    $wp   = @$ '.workplace'
    attr  = $wp.attr('name')
    val   = $wp.val()

    @model.set attr, val