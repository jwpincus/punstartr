
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
        // come back to change color of thumb to show upvote recorded properly
      }).fail(function(error) {
        console.log(error);
      });
    }
    createVote();
  });
});
