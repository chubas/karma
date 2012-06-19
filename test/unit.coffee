# Tried with normal require, with requirejs. I guess I should stop trying random things...

requirejs = require 'requirejs'

requirejs.config({
    nodeRequire: require
});

requirejs '../javascripts/neon/neon.js'

requirejs '../js_source/karma/karma'
requirejs '../js_source/karma/chameleon'

chameleon = new Karma.Chameleon() # This doesn't work...
