(($) ->
  class TodoTitleInput
    constructor: (input) ->
      @$input = $(input)

      @$input.on "keypress", (e) => @keypress(e)
      @$input.on "blur", (e) => @blur(e)

    keypress: (e) ->
      if e.keyCode is 27
        @handleEscape()
      else if e.keyCode is 13
        @handleEnter()

    blur: ->
      @submitFormOrDestroy()

    handleEscape: ->
      @$input
        .val(@$input.data("original-value"))
        .parents("li")
        .removeClass("editing")

    handleEnter: ->
      @submitFormOrDestroy()
      return false

    submitFormOrDestroy: ->
      if @$input.val().trim().length is 0
        @destroyTodo()
      else
        @submitForm()

    submitForm: ->
      @$input.parents("form").submit()

    destroyTodo: ->
      @$input.parents("li").find(".destroy").click()

  $.fn.todoTitleInput = ->
    @each ->
      data = $.data(@, 'todoTitleInput')
      data = $.data(@, 'todoTitleInput', new TodoTitleInput(@)) unless data
)($)

$(document).on "keypress", "[data-behavior~=submit_on_enter]", (e) ->
  if e.keyCode is 13
    $(@).closest("form").submit() if $(@).val().trim().length
    e.preventDefault()

$(document).on "click", "[data-behavior~=submit_on_check]", ->
  $(@).closest("form").submit()

$(document).on "dblclick", "[data-behavior~=todo_title]", ->
  $(@).closest("li")
    .addClass("editing")
    .siblings()
    .removeClass("editing")

  $(@).closest("li").find("[data-behavior~=todo_title_input]").focus()

$(document).on "focus", "[data-behavior~=todo_title_input]", ->
  $(@).todoTitleInput()

$(document).on "ajax:before", "form[data-remote]", ->
  $(@).addClass("submitting")

$(document).on "ajax:complete", "form[data-remote]", ->
  $(@).removeClass("submitting")