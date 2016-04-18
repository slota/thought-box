function editLink(){
  // $('#post-name').on('click', function(){
  $('.links-list').delegate('#name','click', function(){
    var editLine = "<input id='name-edit' type ='text' value ='" + $(this).text() + "'></input>"
    $(this).closest("#name").replaceWith($(editLine))
  })

  $('.links-list').delegate('#description','click', function(){
    var editLine = "<input id='description-edit' type ='text' value ='" + $(this).text() + "'></input>"
    $(this).closest("#description").replaceWith($(editLine))
  })

  $('.links-list').delegate('#name-edit','keypress', function(e){
    if (e.which == 13) {
      var $link = $(this).closest(".link")
      var newName = $(this).val()
      // debugger;
      $.ajax({
        type: 'PATCH',
        url: 'api/v1/links/' + $link.children().children().attr("data-id"),
        data: {name: newName},
        success: function() {
          $('.links-list').empty(),
          fetchLinks()
        },
        error: function(xhr) {
          console.log(xhr)
        }
      })

    }
  })

  $('.links-list').delegate('#description-edit','keypress', function(e){
    if (e.which == 13) {
      var $link = $(this).closest(".link")
      var newDescription = $(this).val()
      // debugger;
      $.ajax({
        type: 'PATCH',
        url: 'api/v1/links/' + $link.children().children().attr("data-id"),
        data: {description: newDescription},
        success: function() {
          $('.links-list').empty(),
          fetchLinks()
        },
        error: function(xhr) {
          console.log(xhr)
        }
      })
    }
  })
}
