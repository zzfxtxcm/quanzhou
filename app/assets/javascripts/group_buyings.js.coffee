# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 滚动
#= require custom/marquee
#= require custom/clock

# 大图幻灯
#= require custom/jquery.easing.1.3
#= require custom/jquery.galleryview-1.1
#= require custom/jquery.timers-1.1.2

$(document).ready ->
  $("#photos").galleryView
    panel_width: 800
    panel_height: 300
    frame_width: 100
    frame_height: 100

  return
