Karma.ColorPicker = Class(Karma, 'ColorPicker').includes(CustomEventSupport)({

  HTML : '<div class="color-picker"></div>',

  prototype :

    element : null

    init : ->
      colorPicker = this
      this.element = $(this.constructor.HTML)
      this.farbtastic = $.farbtastic this.element
      this.farbtastic.linkTo (color) ->
        colorPicker.dispatch 'colorChanged', color: color

    deactivate : ->
      this.element.hide()
      this

    activate : ->
      this.element.show()
      this

    renderIn : (where) ->
      where.append(this.element)
      this

})

