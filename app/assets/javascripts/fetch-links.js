function fetchLinks(){
  $.ajax({
    type: "GET",
    url: "api/v1/links",
    success: function(allLinks){
      renderIndexLinks(allLinks)
    }
  })
}

function renderIndexLinks(allLinks){
  var index = allLinks.map(function(link){
    return(
      "<div class='link'>"
      + "<div id='url' type = 'text'>" + link.url + "</div>"
      + " "
      + "<div id='title' type = 'text'>" + link.title + "</div>"
      + "<div id='buttons'>"
      + "<button type='button' class='mark-as-read' data-id='"+ link.id +"'>Mark as Read</button>"
      + "<button type='button' class='edit' data-id='"+ link.id +"'>edit</button>"
      + "</div>"
      + "</div>"
    )
  })
  $('.links-list').append(index)
}
