
$(document).ready(function() {
  $('#thumbup').on('click', function() {
    function createVote() {
      return $.ajax({
        url: '/api/v1/votes',
        method: 'POST',
        dataType: 'json',
        data:
        { post:
          { vote_type: "upvote", project_id: $("input#project_id").val() } }
      }).done(function(data) {
        $('#thumbup').addClass("green-thumb")
        // come back to change color of thumb to show upvote recorded properly
        // come back and append text for "you have upvoted this project!"
        // message for "you have already voted!"
      }).fail(function(error) {
        console.log(error);
      });
    }
    createVote();
  });
});
