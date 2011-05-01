(function($){
  var Ql = Ql || {};

  Ql = {
    init: function Ql_init(){
	  // some code that needs to be executed after doc ready
	  Ql.bindEvents();
    },
    bindEvents: function Ql_liveEvents(){
      $('a[rel*=external]').live('click',function(){
        window.open(this.href);
        return false;
      });

    // more globally bound events
	  },
    submit: function(ajax_url,ajax_data,ajax_type,callback){
      $.ajax({
        type: ajax_type,
        url: ajax_url,
        data: ajax_data,
        success: function(data) {
          if(typeof callback.onSuccess == 'function'){
            callback.onSuccess.call(this, data);
          }
        },
        error: function(data,status){
          if(typeof callback.onError == 'function'){
            if(data.status == '403') {
              return callback.onDenied.call(this, data);
            }
            callback.onError.call(this, data);
          }
        },
        complete: function(data){
          if(typeof callback.onComplete == 'function'){
            callback.onComplete.call(this, data);
          }
        },
        denied: function(data){
          if(typeof callback.onDenied == 'function'){
            callback.onDenied.call(this, data);
          }
        }
      });
    },
    helpers: {
      // helper for searching through arrays
      arraySearch: function(a){
        var o = {};
        for(var i=0;i<a.length;i++){
          o[a[i]]='';
        }
        return o;
      }
    }
  }

  window.Ql = Ql;
  $(document).ready(Ql.init);

})(jQuery);

$(document).ready(function() {
  
  // external links
  
  $("a").each(function(i, v) {
    if ($(v).attr('href').indexOf('http') > -1) {
      $(v).attr('target','_blank');
    }
  });
  
  // obfuscation
  
  $('.obfuscated').each(function(i, v) {
    var email = $(v).attr('data-value').replace('----', '@').replace('____', '.');
    $(v).replaceWith('<a href="mailto:' + email + '" class="obfuscated">' + email + '</a>');
  });
  
  // collapsibles and lists
  
  $(".expand").click(function() {
    if ($(this).html() == "+")
      $(this).html("-");
    else
      $(this).html("+");
    
    var next = $(this).parent().parent().next("ul");
    if (next.length > 0) {
      if (next.filter("ul:visible").length > 0)
        next.hide("blind", "fast");
      else
        next.show("blind", "fast");
    }
    
    return false;
  });
  
  // orbit
  
  $(window).load(function() {
    $('.slider').each(function(i, v) {
      $(v).orbit({
    		'bullets': true,
    		'timer' : true,
    		'advanceSpeed' : 7000,
    		'animation' : 'horizontal-slide'
    	});
    });
  });
  
  // lightbox_me
  
  $('a.lightbox, button.lightbox, input.lightbox').click(function() {
    var e = '#' + $(this).attr('data-lightbox');
    $(e).lightbox_me({centered: true});
    return false;
  });

  // flattr
  
  if ($('a.FlattrButton').length > 0) {
    (function() {
      var s = document.createElement('script'), t = document.getElementsByTagName('script')[0];
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'http://api.flattr.com/js/0.6/load.js?mode=auto';
      t.parentNode.insertBefore(s, t);
    })();
  }
  
});
