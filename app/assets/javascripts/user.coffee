# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $("li[data-painel-menu]").click (view) ->
        view.preventDefault()
        option = $(this).data("painel-menu")
        $(".active").removeClass("active")
        $(this).addClass("active")
        $.get ('layouts/' + $(this).data("painel-menu"))
