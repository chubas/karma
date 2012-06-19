# Tried with normal require, with requirejs. I guess I should stop trying random things...

{ Neon } = require '../javascripts/neon/neon.js'
global['Class'] = Neon.Class
global['Module'] = Neon.Class

require '../javascripts/neon/customEvent.js'
require '../javascripts/neon/customEventSupport.js'

require '../javascripts/utils/color.js'

global['Karma'] = {}

require '../js_source/karma/chameleon'
require '../js_source/karma/rule'
require '../js_source/karma/colorPicker'

require '../javascripts/tellurium/tellurium.js'

Tellurium.suite('Karma.Chameleon') ->

  this.describe('Creating an initial rule') ->

    this.specify('It should have a baseRule property') ->
      chameleon = new Karma.Chameleon()
      this.assert(chameleon.baseRule).not().toBe(null)
      this.completed()

Tellurium.run()

#chameleon = new Karma.Chameleon()
#base = chameleon.addBaseRule()
#
#base.bind 'colorChanged', (data) ->
#  console.log "Color changed to #{data.color.toHTML()}"
#
#base.setColor '#009933'
