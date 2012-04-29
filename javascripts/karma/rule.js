Karma.Rule = new Class(Karma, 'Rule').includes(CustomEventSupport)({
    prototype : {

        currentColor : null,

        init : function(params) {
            params = params || {};
            this.name = params.name;
        },

        setColor : function(color) {
            this.currentColor = color;
            this.dispatch('colorChanged', { color : new Color(color) });
        },

        refresh : function() {
            this.setColor(this.currentColor);
        },

        setRule : function(params) {
            var rule = this;
            this.target = params.target;
            this.rule   = params.rule;
            this.args   = params.args;
            this.target.bind('colorChanged', function(data) {
                var colorClone = data.color.copy();
                var newColor   = rule._applyRule(params.rule, colorClone, params.args);
                rule.setColor(newColor);
            });
        },

        getArgsFor : function(rule) {
            switch(rule) {
                case 'complementary':
                    return [];
                case 'obscureBy':
                case 'iluminateBy':
                    return [25];
                case 'rotateBy':
                    return [60];
                default:
                    return [];
            }
        },

        _applyRule : function(rule, color, args) {
            return color[rule].apply(color, args);
        }
    }
});
