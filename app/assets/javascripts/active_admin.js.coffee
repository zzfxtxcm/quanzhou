#= require active_admin/base
#= require_self
#= require ckeditor/init

# 地图弹出
jQuery.fn.selectCity = (targetId) ->
  _seft = this
  targetId = $(targetId)
  @click ->
    A_top = $(this).offset().top + $(this).outerHeight(true) #  1
    A_left = $(this).offset().left
    targetId.bgiframe()
    targetId.show().css
      position: "absolute"
      top: A_top + "px"
      left: A_left + "px"

    return

  targetId.find("#selectItemClose").click ->
    targetId.hide()
    return

  targetId.find("#selectSub :checkbox").click ->
    targetId.find(":checkbox").attr "checked", false
    $(this).attr "checked", true
    _seft.val $(this).val()
    targetId.hide()
    return

  $(document).click (event) ->
    targetId.hide()  unless event.target.id is _seft.selector.substring(1)
    return

  targetId.click (e) ->
    e.stopPropagation() #  2
    return

  this

$ ->

  #test1:
  $("#new_home_map_address").selectCity "#selectItem"
  return
