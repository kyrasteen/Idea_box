$(document).ready(function(){
  renderAllIdeas();
  renderNewIdeaForm();
});

function renderAllIdeas() {
  $.getJSON('/api/v1/ideas').
    then(function(data) {
    paintIdeas(data);
    data.forEach(function(idea) {
      bindDeleteIdea(idea);
    });
    filterAndRender(data);
  });
}

function filterAndRender(ideas) {
  $("#search-bar").on("change keyup", function(e){
    var filteredIdeas = ideas.filter(function(idea) {
      return idea.title.indexOf(e.target.value) > -1;
    });
    paintIdeas(filteredIdeas);
  });
}

function ideaBody(idea) {
  return "<div class='idea'>" + "<h3>" + idea.title + "</h3>" +
    "<p>" + idea.body + "</p>" + "<p>quality: " + idea.quality +
    "</p>" + "<div><a id='edit' href='/ideas/" + idea.id +
    "/edit'>edit</a></div>" + "<div><a id='delete" + idea.id + "'" +
    "href=''>delete</a></div>" + "</div>"
}

function paintIdeas(ideas) {
  $("#ideas").remove();
  ideas.forEach(function(idea) {
    $("#ideas").append(ideaBody(idea))
  });
}

function renderNewIdeaForm() {
  const $form    = $("#new_idea")
  const $title   = $form.find("#new-title")
  const $body    = $form.find("#new-body")
  const $quality = $form.find("#new-quality")
  const $submit  = $form.find("#submit")

  $submit.on("click", function(){
    $.post('/api/v1/ideas', {
      idea: {
        title: $title.val(),
        body: $body.val(),
      }
    })
  })
}

function bindDeleteIdea(idea) {
  var deleteBtn = "#delete" + idea.id
  $(deleteBtn).on("click", function(){
    var $idea = $(this).parents('.idea');
    $.ajax('/api/v1/ideas/' + idea.id, { method: 'delete'}).then(function (){
      $idea.remove();
    })
  })
}
