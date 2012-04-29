Karma.ColorPicker = Class(Karma, 'ColorPicker').includes(CustomEventSupport)({

    HTML : '<div class="color-picker"></div>',

    prototype : {

        element : null,

        init : function() {
            var colorPicker = this;
            this.element = $(this.constructor.HTML);
            this.farbtastic = $.farbtastic(this.element);
            this.farbtastic.linkTo(function(color) {
                colorPicker.dispatch('colorChanged', { color : color });
            });
        },

        deactivate : function() {
            this.element.hide();
        },

        activate : function() {
            this.element.show();
        },

        renderIn : function(where) {
            where.append(this.element);
        }
    }
});