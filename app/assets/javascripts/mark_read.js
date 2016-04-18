
function markRead(){
  $('.links-list').delegate('.mark-as-read','click', function(){
    var linkId = $(this).attr("data-id")
      $.ajax({
      type: 'PATCH',
      url: 'api/v1/ideas/'+ $idea.children().children().attr("data-id"),
      data: {quality: newQuality},
      success: function() {
        $("#post-name").val(""),
        $("#post-description").val(""),
        $('.links-list').empty(),
        fetchIdeas()
      },
      error: function(xhr) {
        console.log(xhr)
      }
    })
  })
}

var checkDown = function(quality){
  if (quality == "genius") {
    return "plausible"
  }
  else {return "swill"}
}
