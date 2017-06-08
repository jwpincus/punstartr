$(document).ready(function(){
    $(".user-edit-field").on('blur', function(){
      var name = $('#name-field').html()
      var email = $('#email-field').html()
      var phone = $('#phone-field').html()
      return $.ajax({
        url: '/api/v1/user',
        method: 'PATCH',
        dataType: 'json',
        data: { name: name, phone: phone, email: email }
      })
    })
})
