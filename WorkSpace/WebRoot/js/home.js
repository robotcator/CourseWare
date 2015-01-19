$(function () {
  //navlist
  $('#navList').on('click', '.nav-btn', function(event) {
    if($(this).hasClass('btn-active')){
      $('#expandZone #closeBtn').click();
      return false;
    }
    var curIndex = $(this).index()
      , mlValue = '-' + curIndex * 100 + '%';
    if( $('#expandZone').hasClass('active') ){
      $('#expandZone .download').animate({marginLeft: mlValue});
    }
    else{
      $('#expandZone .download').css({marginLeft: mlValue});
    }
    var device = $(this).data('device');
    $(this).addClass('btn-active').siblings().removeClass('btn-active');
    $(device).addClass('item-active').siblings().removeClass('item-active');
    $('#expandZone').animate({height: '130px'}).addClass('active');
    return false;
  });

  $('#expandZone #closeBtn').on('click', function() {
    $('#expandZone').animate({height: '0px'}, function () {
      $(this).removeClass('active');
      $('#navList .btn-active').removeClass('btn-active');
    });
    return false;
  });
});