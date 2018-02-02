class GuestBook.MessagesIndex
  @init: ->
    @bind()

  @bind: ->
    $('.message-form .validate').on 'keyup blur', validateOneFiled
    $('.message-form .validate').on 'change', validateFields

  validateOneFiled= ->
    $this = $(this)
    id = $this[0].id
    status = if $this[0].type == 'email' then validateEmail() else validate(id, $this.data('length'))
    freezeBtn(status)
    addHasErrorClass(status, id)

  validateFields= ->
    status = validate('message_name', 3) && validateEmail() && validate('message_message', 5)
    freezeBtn(status)

  validateEmail= ->
    email = $('#message_email').val()
    regex = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i
    return regex.test(String(email).toLowerCase())

  validate= (id, count)->
    return $("##{id}").val().length > count

  addHasErrorClass = (status, id)->
    closestDiv = $("##{id}").closest('.form-group')
    if status then closestDiv.removeClass('has-error') else closestDiv.addClass('has-error')

  freezeBtn= (status) ->
    btn = $('.create-msg-btn')
    if status then btn.removeAttr('disabled') else btn.attr('disabled', true)

class GuestBook.MessagesCreate extends GuestBook.MessagesIndex