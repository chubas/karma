$ ->
    karma = new Karma.Chameleon()
    base = karma.addBaseRule()
    rule1 = karma.addRule rule: 'complementary', target: base, name: 'rule1'
    rule2 = karma.addRule rule: 'obscureBy', args: [10], target: rule1, name: 'rule2'
    rule3 = karma.addRule rule: 'rotateBy', args: [30], target: rule2, name: 'rule3'
    rule4 = karma.addRule rule: 'rotateBy', args: [60], target: rule2, name: 'rule4'

    changeColor = (rule) ->
        rule.bind 'colorChanged', (data) ->
            $(".#{rule.name}").css 'background-color', data.color.toHTML()

    changeColor rule for rule in [base, rule1, rule2, rule3, rule4]

    createRandomColor = ->
        color = "#"
        for i in [0...3]
            c = Math.round(Math.random() * 255).toString(16)
            color += if c.length is 1 then "0#{c}" else c
        color

    base.setColor createRandomColor()

    createControls = (rule) ->
        controls = $('<div class="controls"></div>')
        targetHandler = $('<div class="rule_name_handler"></div>').text(rule.target.name).appendTo(controls)
        targetHandler.draggable()

        select = $('<select></select>').appendTo(controls)
        select.append $('<option value="complementary">complementary</option>')
        select.append $('<option value="obscureBy">obscureBy</option>')
        select.append $('<option value="iluminateBy">iluminateBy</option>')
        select.append $('<option value="rotateBy">rotateBy</option>')
        select.val(rule.rule)
        select.bind 'change', ->
            rule.setRule rule: select.val(), target: rule.target, args: rule.getArgsFor select.val()
            addControl rule
            base.refresh()

        if rule.args
            argsInput = $('<div class="args"></div>').appendTo(controls)
            for arg in rule.args
                selector = new Karma.UI.NumericSelector(value: arg)
                selector.renderIn(argsInput)
                selector.bind 'change', (data) ->
                    rule.setRule rule: rule.rule, target: rule.target, args: [data.value]
                    base.refresh()

        $(".#{rule.name}").append controls

    addControl = (rule) ->
        $(".#{rule.name}").find('.controls').remove()
        createControls(rule)

    (addControl rule for rule in [rule1, rule2, rule3, rule4])

    baseColorPicker = $('<div class="color-picker"></div>').appendTo $('.base')
    colorPicker = new Karma.ColorPicker()
    colorPicker.deactivate()

    $('.base').bind 'click', ->
        colorPicker.activate()
        closeIt = ->
            colorPicker.deactivate()
            $(document).unbind 'click', closeIt
        $(document).bind 'click', closeIt
        false

    colorPicker.bind 'colorChanged', (data) ->
        base.setColor data.color

    colorPicker.renderIn baseColorPicker

    $('.color-container').droppable(
      activeState: 'active'
    )