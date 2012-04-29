Class('CustomEvent')({
    bubbles   : true,
    cancelable : true,
    currentTarget : null,
    timesStamp : 0,
    target    : null,
    type      : '',
    isPropagationStopped : false,
    isDefaultPrevented : false,
    isImmediatePropagationStopped : false,
    areImmediateHandlersPrevented : false,
    prototype : {
        init : function (type, data) {
            this.type = type;
            $.extend(this, data);
        },
        stopPropagation : function () {
            this.isPropagationStopped = true;
        },
        preventDefault : function () {
            this.isDefaultPrevented = true;
        },
        stopImmediatePropagation : function () {
            this.preventImmediateHandlers();
            this.stopPropagation();
        },
        preventImmediateHandlers : function () {
            this.areImmediateHandlersPrevented = true;
        }
    }
});
