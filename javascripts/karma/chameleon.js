Karma.Chameleon = Class(Karma, 'Chameleon')({
    prototype : {
        baseRule : null,

        init : function() {
        },

        addRule : function(params) {
            var newRule    = new Karma.Rule({ name : params.name });
            newRule.setRule(params);
            return newRule;
        },

        addBaseRule : function() {
            this.baseRule = new Karma.Rule();
            this.baseRule.name = 'base';
            return this.baseRule;
        }
    }
});