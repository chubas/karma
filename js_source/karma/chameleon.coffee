Karma.Chameleon = Class(Karma, 'Chameleon')({

  prototype :

    baseRule : null,

    addRule : (params) ->
      newRule = new Karma.Rule name: params.name
      newRule.setRule(params)
      newRule

    addBaseRule : ->
      this.baseRule = new Karma.Rule()
      this.baseRule.name = 'base'
      this.baseRule
})

