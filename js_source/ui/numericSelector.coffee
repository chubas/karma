Karma.UI.NumericSelector = new Class(Karma.UI, 'NumericSelector').includes(CustomEventSupport)({
	HTML : '<input type="text"/>',

	prototype : {
		init : (config) ->
			selector = this
			this.element = $(this.constructor.HTML).val(config.value)
			this.element.bind 'change', ->
				selector.dispatch 'change', value: parseInt($(this).val(), 10)
				true

		renderIn : (where) ->
			where.append this.element
	}
})