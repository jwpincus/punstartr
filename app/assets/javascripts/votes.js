
// $(document).ready(function() {

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
        $('#thumbdown').removeClass("red-thumb");
        $('#votes_count').text('Yeah! Your vote has been saved!');
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
          $('#thumbdown').addClass("red-thumb");
          $('#votes_count').text('Boooo. Your vote has been removed.');
        }).fail(function(error) {
          console.log(error);
        });
      }
      deleteVote();
    });

// });
