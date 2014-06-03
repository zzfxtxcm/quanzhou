# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(".J_MenuItem").each (index) ->
    $(this).mouseover ->
      catTop = undefined
      borderTop = $(this).offset().top - 350
      viewHeight = $(window).height()
      scrollTop = $(document).scrollTop()
      relaxHeight = viewHeight - (borderTop - scrollTop)
      $(".border").css("top", borderTop).show()
      $(".cat-subcategory").show()
      $(".shadow div").hide().eq(index).show()
      catHeight = $(".cat-subcategory").height()
      if catHeight <= relaxHeight
        catTop = borderTop
      else if catHeight > relaxHeight and catHeight < viewHeight
        catTop = scrollTop + viewHeight - catHeight - 10
      else
        catTop = scrollTop + 5
      $(".cat-subcategory").css "top", catTop
      $("span").show()
      $(this).find("span").hide()
      return

    $(".mallCategory").mouseleave ->
      $(".cat-subcategory").hide()
      $(".border").hide()
      $("span").show()
      return

    return

  return
