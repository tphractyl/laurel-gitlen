//= require jquery
//= require rails-ujs
//= require jquery-ui/widgets/sortable
//= require s3_direct_upload
//= require turbolinks
//= require_tree ../../../vendor/assets/javascripts/.
//= require_tree .

function centerSlides(){
  $(".slide img:visible").each(function() {
    centerSlide($(this));
  });
}

function centerSlide(image){
  
  var galleryHeight = $(window).height() - 52,
    maxHeight = Math.floor( galleryHeight * 0.8),
    maxWidth = Math.floor($(window).width() * 0.8),
    trueHeight = $(image).height(),
    trueWidth = $(image).width(),
    newHeight = $(image).height(),
    newWidth = $(image).width(),
    top = 0;
    
  if(maxWidth < newWidth){
    newWidth = maxWidth;
    newHeight = Math.floor( (maxWidth / trueWidth) * trueHeight );
  }
  
  if(maxHeight < newHeight){
    newHeight = maxHeight;
    newWidth = Math.floor( (maxHeight / trueHeight) * trueWidth );
  }

  top = Math.floor( (galleryHeight - newHeight) / 2 );

  $(image).css({
    "max-height": maxHeight + 'px',
    "max-width": maxWidth + 'px',
    "height": "auto",
    "width": "auto",
    "margin-top": top + "px"
  });

  $("#gallery-slides .slide").css("width", $("#gallery").width() + "px");
}

$(window).resize(function(){
  centerSlides();
});

$(document).on('click', '.exhibition-nav', function(){
  $('.exhibition-nav').parent().toggleClass('active');
  $('#works, #artists').toggle();
  return false;
});

$(document).on('click', '.get', function(){
  if($(this).attr("disabled") === "disabled"){
    return false;
  }else {
    $.get($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  }
});

$(document).on('mouseover', '.artist-link', function(){
  var img_class = "." + $(this).attr("id") + '-img'
  $(img_class).animate({'opacity': 1}, 1000);
  
  return false;
});

$(document).on('click', '.artist-exhibitions-link', function(){
  $('#artist-exhibitions').toggle();
  return false;
});

$(document).on('ajax:before', 'form', function(event, xhr, settings) {
  $(this).
    attr("disabled", "disabled").
    addClass("disabled").
    addClass("working");
  
  $('#modal-form').addClass("working");
});

$(document).on('ajax:complete', 'form', function(event, xhr, settings) {
  $(this).
    removeAttr("disabled").
    removeClass("disabled").
    removeClass("working");
  
  $("#modal-form").removeClass("working");
});

$(document).on('click', '#toggle-roster-artists', function() {
  var $toggler = $(this);
  $('.admin-artist.non-roster').toggle();
  if( $toggler.hasClass('showing') ){
    $toggler.removeClass('showing');
    $toggler.html('Show All Artists');
    return false;
  }else{
    $toggler.addClass('showing');
    $toggler.html('Hide Extra Artists');
    return false;
  }
});
  