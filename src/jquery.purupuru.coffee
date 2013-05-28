###
jquery.purupuru-anim-horizontal_TS.js
@license under the incredibly permissive MIT License.
@Copyright © 2013 Takeharu.Oshida
###
(($) ->
  cssStr = "
.purupuruBase_TS {
  -webkit-animation-delay: DELAY;
  -webkit-animation-duration: DURATIONms;
}

.purupuru0_TS {
  -webkit-animation-name: purupuru-anim-horizontal_TS;
}

.purupuru1_TS {
  -webkit-animation-name: purupuru-anim-vertical_TS;
}

.purupuru2_TS {
  -webkit-animation-name: purupuru-anim-multi_TS;
}

.purupuruInfinite {
  -webkit-animation-iteration-count: infinite;
}

@-webkit-keyframes 'purupuru-anim-horizontal_TS' {
  from {
    -webkit-transform:translate3d(0px , $10px , 0);
  }
  10% {
    -webkit-transform:translate3d(0px , -$9px , 0);
  }
  20% {
    -webkit-transform:translate3d(0px , $8px , 0);
  }
  30% {
    -webkit-transform:translate3d(0px , -$7px , 0);
  }
  40% {
    -webkit-transform:translate3d(0px , $6px , 0);
  }
  50% {
    -webkit-transform:translate3d(0px , -$5px , 0);
  }
  60% {
    -webkit-transform:translate3d(0px , $4px , 0);
  }
  70% {
    -webkit-transform:translate3d(0px , -$3px , 0);
  }
  80% {
    -webkit-transform:translate3d(0px , $2px , 0);
  }
  90% {
    -webkit-transform:translate3d(0px , -$1px , 0);
  }
  to {
    -webkit-transform:translate3d(0px , 0px , 0);
  }
}

@-webkit-keyframes 'purupuru-anim-vertical_TS' {
  from {
    -webkit-transform:translate3d($10px , 0px , 0);
  }
  10% {
    -webkit-transform:translate3d(-$9px , 0px , 0);
  }
  20% {
    -webkit-transform:translate3d($8px , 0px , 0);
  }
  30% {
    -webkit-transform:translate3d(-$7px , 0px , 0);
  }
  40% {
    -webkit-transform:translate3d($6px , 0px , 0);
  }
  50% {
    -webkit-transform:translate3d(-$5px , 0px , 0);
  }
  60% {
    -webkit-transform:translate3d($4px , 0px , 0);
  }
  70% {
    -webkit-transform:translate3d(-$3px , 0px , 0);
  }
  80% {
    -webkit-transform:translate3d($2px , 0px , 0);
  }
  90% {
    -webkit-transform:translate3d(-$1px , 0px , 0);
  }
  to {
    -webkit-transform:translate3d(0px , 0px , 0);
  }
}

@-webkit-keyframes 'purupuru-anim-multi_TS' {
  from {
    -webkit-transform:translate3d($10px , $10px , 0);
  }
  10% {
    -webkit-transform:translate3d(-$9px , -$9px , 0);
  }
  20% {
    -webkit-transform:translate3d($8px , $8px , 0);
  }
  30% {
    -webkit-transform:translate3d(-$7px , -$7px , 0);
  }
  40% {
    -webkit-transform:translate3d($6px , $6px , 0);
  }
  50% {
    -webkit-transform:translate3d(-$5px , -$5px , 0);
  }
  60% {
    -webkit-transform:translate3d($4px , $4px , 0);
  }
  70% {
    -webkit-transform:translate3d(-$3px , -$3px , 0);
  }
  80% {
    -webkit-transform:translate3d($2px , $2px , 0);
  }
  90% {
    -webkit-transform:translate3d(-$1px , -$1px , 0);
  }
  to {
    -webkit-transform:translate3d(0px , 0px , 0);
  }
}
  "

  $.fn.purupuru = (config) ->
    defaults =
      direction:0
      infinite:false
      animationDelay:0
      animationDuration:250
      purupuruBuffer:10
    options = $.extend defaults, config
    ts = new Date().getTime()
    step = options.purupuruBuffer/10
    style = cssStr.replace(/TS/g,ts)
      .replace(/DELAY/g,options.animationDelay)
      .replace(/DURATION/g,options.animationDuration)
      .replace(/\$10/g,options.purupuruBuffer)
      .replace(/\$9/g,options.purupuruBuffer - (step*1))
      .replace(/\$8/g,options.purupuruBuffer - (step*2))
      .replace(/\$7/g,options.purupuruBuffer - (step*3))
      .replace(/\$6/g,options.purupuruBuffer - (step*4))
      .replace(/\$5/g,options.purupuruBuffer - (step*5))
      .replace(/\$4/g,options.purupuruBuffer - (step*6))
      .replace(/\$3/g,options.purupuruBuffer - (step*7))
      .replace(/\$2/g,options.purupuruBuffer - (step*8))
      .replace(/\$1/g,options.purupuruBuffer - (step*9))
    $("<style id=#{ts} type='text/css'>#{style}</style>").appendTo "head"
    classNm = "purupuruBase_#{ts} purupuru#{options.direction}_#{ts}"
    if options.infinite then classNm+=" purupuruInfinite"
    @.each ->
      $(@).on "webkitAnimationEnd", ->
        if not options.infinite
          $(@).removeClass classNm
          $("##{ts}").remove()
      $(@).addClass classNm
    $(@)
) jQuery
