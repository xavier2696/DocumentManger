# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
 @submitEvent = ->
    $('.new_user').submit ->
      validateForm = undefined

      validateForm = ->
        if $('#user_email').val() == ''
          return 'Ingrese un correo.'
        if $('#user_email').val().match(new RegExp(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/g)) == null
          return 'El formato del correo no es correcto.'
        if $('#user_username').val() == ''
          return 'Ingrese un nombre de usuario.'
        if $('#user_department_id').val() == ''
          return 'Debe de seleccionar un departamento.'
        if $('#user_position').val() == ''
          return 'Ingrese un puesto.'
        if $('#user_password').val() == ''
          return 'Ingrese una contraseña'
        if $('#user_password').val().length < 6
          return 'La contraseña debe de tener un mínimo de  6 caracteres.'
        if $('#user_password').val() != $('#user_password_confirmation').val()
          return 'Las contraseñas no son iguales.'
        return ''
      message = validateForm()
      if message == ''
      	return true
      toastr.warning(message)
      false