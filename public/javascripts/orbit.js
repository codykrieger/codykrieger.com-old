(function(e){e.fn.orbit=function(a){a=e.extend({animation:"fade",animationSpeed:800,timer:true,advanceSpeed:4E3,pauseOnHover:true,startClockOnMouseOut:true,startClockOnMouseOutAfter:1E3,directionalNav:true,captions:true,captionAnimation:"fade",captionAnimationSpeed:800,bullets:false,bulletThumbs:false,bulletThumbLocation:"",afterSlideChange:function(){}},a);return this.each(function(){function t(){if(a.timer)if(u.is(":hidden"))v=setInterval(function(){o("next")},a.advanceSpeed);else{r=true;A.removeClass("active");
v=setInterval(function(){var c="rotate("+p+"deg)";p+=2;w.css({"-webkit-transform":c,"-moz-transform":c,"-o-transform":c});if(p>180){w.addClass("move");B.addClass("move")}if(p>360){w.removeClass("move");B.removeClass("move");p=0;o("next")}},a.advanceSpeed/180)}else return false}function q(){if(a.timer){r=false;clearInterval(v);A.addClass("active")}else return false}function C(){if(a.captions){var c=d.eq(b).data("caption");if(_captionHTML=e(c).html()){l.attr("id",c).html(_captionHTML);a.captionAnimation==
"none"&&l.show();a.captionAnimation=="fade"&&l.fadeIn();a.captionAnimation=="slideOpen"&&l.slideDown()}else{a.captionAnimation=="none"&&l.hide();a.captionAnimation=="fade"&&l.fadeOut();a.captionAnimation=="slideOpen"&&l.slideUp()}}else return false}function D(){if(a.bullets)F.children("li").removeClass("active").eq(b).addClass("active");else return false}function o(c){function g(){d.eq(m).css({"z-index":1});x=false;a.afterSlideChange.call(this)}var m=b,h=c;if(m==h)return false;if(!x){x=true;if(c==
"next"){b++;if(b==s)b=0}else if(c=="prev"){b--;if(b<0)b=s-1}else{b=c;if(m<b)h="next";else if(m>b)h="prev"}D();d.eq(m).css({"z-index":2});a.animation=="fade"&&d.eq(b).css({opacity:0,"z-index":3}).animate({opacity:1},a.animationSpeed,g);if(a.animation=="horizontal-slide"){h=="next"&&d.eq(b).css({left:k,"z-index":3}).animate({left:0},a.animationSpeed,g);h=="prev"&&d.eq(b).css({left:-k,"z-index":3}).animate({left:0},a.animationSpeed,g)}if(a.animation=="vertical-slide"){h=="prev"&&d.eq(b).css({top:y,"z-index":3}).animate({top:0},
a.animationSpeed,g);h=="next"&&d.eq(b).css({top:-y,"z-index":3}).animate({top:0},a.animationSpeed,g)}if(a.animation=="horizontal-push"){if(h=="next"){d.eq(b).css({left:k,"z-index":3}).animate({left:0},a.animationSpeed,g);d.eq(m).animate({left:-k},a.animationSpeed)}if(h=="prev"){d.eq(b).css({left:-k,"z-index":3}).animate({left:0},a.animationSpeed,g);d.eq(m).animate({left:k},a.animationSpeed)}}C()}}var b=0,s=0,k,y,x,j=e(this).addClass("orbit"),f=j.wrap('<div class="orbit-wrapper" />').parent();j.add(k).width("1px").height("1px");
var d=j.find("img, a img, div");d.each(function(){var c=e(this),g=c.width();c=c.height();if(g>j.width()){j.add(f).width(g);k=j.width()}if(c>j.height()){j.add(f).height(c);y=j.height()}s++});d.eq(b).css({"z-index":3}).fadeIn(function(){d.css({display:"block"})});if(a.timer){f.append('<div class="timer"><span class="mask"><span class="rotator"></span></span><span class="pause"></span></div>');var u=e("div.timer"),r;if(u.length!=0){var w=e("div.timer span.rotator"),B=e("div.timer span.mask"),A=e("div.timer span.pause"),
p=0,v;t();u.click(function(){r?q():t()});if(a.startClockOnMouseOut){var E;f.mouseleave(function(){E=setTimeout(function(){r||t()},a.startClockOnMouseOutAfter)});f.mouseenter(function(){clearTimeout(E)})}}}f.mouseenter(function(){q()});if(a.captions){f.append('<div class="orbit-caption"></div>');var l=f.children(".orbit-caption");C()}if(a.directionalNav){f.append('<div class="slider-nav"><span class="right">Right</span><span class="left">Left</span></div>');var n=f.children("div.slider-nav").children("span.left"),
z=f.children("div.slider-nav").children("span.right");n.click(function(){q();o("prev")});z.click(function(){q();o("next")})}if(a.bullets){f.append('<ul class="orbit-bullets"></ul>');var F=e("ul.orbit-bullets");for(i=0;i<s;i++){n=e("<li>"+(i+1)+"</li>");if(a.bulletThumbs)if(z=d.eq(i).data("thumb")){n=e('<li class="has-thumb">'+i+"</li>");n.css({background:"url("+a.bulletThumbLocation+z+") no-repeat"})}e("ul.orbit-bullets").append(n);n.data("index",i);n.click(function(){q();o(e(this).data("index"))})}D()}})}})(jQuery);