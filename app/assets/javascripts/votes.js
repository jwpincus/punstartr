
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
        $('#thumbup').addClass("aqua-thumb");
        $('#votes_section').append('<p class="post>' + "Your vote has been saved!" + '</p>');

        // come back to change color of thumb to show upvote recorded properly
        // come back and append text for "you have upvoted this project!"
        // message for "you have already voted!"
      }).fail(function(error) {
        console.log(error);
      });
    }
    createVote();
  });

  $('#thumbdown').on('click', function() {
      function deleteVote() {
        var id = $("#project_id").val();
        return $.ajax({
          url: '/api/v1/votes/' + id,
          method: 'DELETE',
        }).done(function(data) {
          $('#thumbup').removeClass("aqua-thumb");
        }).fail(function(error) {
          console.log(error);
        });
      }
      deleteVote();
    });

    $('form').on('submit', function(event){
    event.preventDefault();
  });

});
