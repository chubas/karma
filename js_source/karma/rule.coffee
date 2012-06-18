Karma.Rule = new Class(Karma, 'Rule').includes(CustomEventSupport)({
  prototype:
    currentColor: null,

    init: (params = {}) ->
      this.name = params.name

    setColor: (color) ->
      this.currentColor = color
      this.dispatch 'colorChanged', color: new Color(color)

    refresh: ->
      this.setColor this.currentColor

    setRule: (params) ->
      rule = this
      this.target = params.target
      this.rule = params.rule
      this.args = params.args;
      this.target.bind 'colorChanged', (data) ->
        colorClone = data.color.copy()
        newColor = rule._applyRule params.rule, colorClone, params.args
        rule.setColor newColor

    getArgsFor : (rule) ->
      switch rule
        when 'complementary' then []
        when 'obscureBy', 'iluminateBy' then [25]
        when 'rotateBy' then [60]
        else []

    _applyRule : (rule, color, args) ->
      color[rule].apply color, args

})
