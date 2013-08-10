$ ->

  $("input.search").focus()

  $(document).keydown (e) ->
    if e.keyCode == 83 && !$("input.search:focus").length
      $("input.search").focus()
      false

  if navigator.userAgent.match(/iPad|iPhone/i)
    $("li input, .queue").click ->
      this.selectionStart = 0
      this.selectionEnd = this.value.length
  else
    $("li input").attr("readonly", "readonly")
    $("li, .storyline").on "mouseover", ->
      i = $(this).find("input").get(0)
      i.selectionStart = 0
      i.selectionEnd = i.value.length

  $(".add-all").click ->
    $("li:visible .emoji").click()

  $.fn.addToStoryLine = ->
    $(this).clone().appendTo(".story").click ->
      $(this).remove()
      $(".queue").val $.map( $(".story .emoji"), (e) -> ":" + $(e).attr("title") + ":" ).join("")
    $(".queue").val $.map( $(".story .emoji"), (e) -> ":" + $(e).attr("title") + ":" ).join("")

  $("body").on "click", "li .emoji", (e) ->
    e.stopPropagation()
    $(this).addToStoryLine()
