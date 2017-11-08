# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('.fa-times').click ->
        $('#flash_div').hide()
$ ->
    $('#submit-article').click ->
        title = $('.article-title').value
        text = $('.article-text').value
        status = $('.article-status').value
        portrait = $('.article-portrait').value
        console.log(portrait)
        console.log(title)
        console.log(text)
        console.log(status)
        

        
jQuery ->
    $("li[data-painel-menu]").click (view) ->
        view.preventDefault()
        option = $(this).data("painel-menu")
        $(".active").removeClass("active")
        $(this).addClass("active")
        $.get ('layouts/' + $(this).data("painel-menu"))

