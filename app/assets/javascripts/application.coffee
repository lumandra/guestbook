#= require rails-ujs
#= require turbolinks
#= require jquery
#= require bootstrap-sprockets
#= require_self
#= require_tree .


window.GuestBook = {}

class GuestBook.Application
  @init: ->

ready = ->
  data       = $('body').data()
  page       = data.page
  controller = data.controller

  GuestBook.Application.init()
  GuestBook[page].init() if GuestBook[page]?

  controller.split('_').concat('').reduce (sum, part) ->
    GuestBook[sum].init() if GuestBook[sum]
    "#{sum}_#{part}"

$(document).ready(ready)
$(document).on("page:load", ready)
$(document).on('page:restore', ready)
$(document).on('turbolinks:load', ready)