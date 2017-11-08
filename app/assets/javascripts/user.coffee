# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $('#user_role').prop('disabled',true)
jQuery ->
    $("a[data-user-email]").click (view) ->
        view.preventDefault()
        email = $(this).data("user-email")
        role = $(this).data("user-role")
        $('#dummy').val(email)
        $('#user_email').val(email)
        $('#user_role').val(role)
        $("#user_role").prop('disabled', false)
        