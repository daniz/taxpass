class App.Models.Appartment extends Backbone.Model
  defaults:
    name              : ''
    ownership         : 1
    family_residence  : no
    months_rent       : 0
    rent              : 0
    expenses          : 0

  toJSON: ->
    _.omit super, ['spouse_name']