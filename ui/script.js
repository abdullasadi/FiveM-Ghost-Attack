


CloseUi = function() {
    $("body").css({
        "display" : "none"
    });
}

window.addEventListener('message', function(event) {
    if (event.data.action == "ghostattack"){    
      var audio = new Audio('https://cdn.discordapp.com/attachments/1029628713563865199/1108481625668464650/horror-sfx-3-103708.mp3');
      audio.play();

      $("body").css({
        "display" : "block"
      });    
      $(".background").css({
        'background-image': `url('img/${event.data.rand}.png')`,
      });   
      setTimeout(function() {
        CloseUi();     
        $.post(`https://${GetParentResourceName()}/close`);
      }, 4000);
    }
});

$(document).keydown(function (e) {
    if (e.keyCode == 27) { 
        CloseUi();     
        $.post(`https://${GetParentResourceName()}/close`);
    }
});