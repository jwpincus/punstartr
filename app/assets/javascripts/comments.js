$('.post-form input[type="submit"]').on('click', createComment);

function createComment() {
  var body = $(this).parent().find('textarea[name="comment[body]"]').val();
  var project_id = $(this).parent().find('input[name="project[id]"]').val();

  return $.ajax({
    url: '/api/v1/comments',
    method: 'POST',
    dataType: 'json',
    data:
    { comment:
      { body: body,
        project_id: project_id
      }
    }
  }).done(function(data){
    $('textarea[name="comment[body]"]').val('');
    return $('#comments-list').append('<p class="comment">' + body + '</p>');
  }).fail(function(error){
    console.log(error);
  });
}

$('form').on('submit', function(event){
  event.preventDefault();
});
