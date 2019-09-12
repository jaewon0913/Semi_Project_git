$(function() {
   var extra_login_width = $(document).width();
   var extra_login_height = $(document).height();
   var mobile_bar_height = window.innerHeight;
   var id = "${id}";
   
    $("#mobile_menu").css({'height': mobile_bar_height,'background': '#aeaeae', 'position':'relative', 'z-index':'5', 'width': '100%', 'left': 0});
    
   $(".dropdown li").mouseover(function() {
      $(this).children(".dropdown_menu").stop().slideDown();
   })

   $(".dropdown li").mouseleave(function() {
      $(this).children(".dropdown_menu").stop().slideUp();
   })

   $("#login_btn_main").click(function() {
      $("#layer_popup").css('display', 'block');
      $("#extra_login").css({
         'width' : extra_login_width,
         'height' : extra_login_height,
         'display' : 'block',
         'background-size' : 'cover'
      })
   })

   $("#extra_login, #layer_popup")
         .on(
               'scroll touchmove mousewheel',
               function(event) {
                  document.getElementsByTagName('body')[0].style.overflow = 'hidden';
                  $("#extra_login").css({
                     'width' : '100%',
                     'height' : extra_login_height,
                     'display' : 'block',
                     'background-size' : 'cover'
                  })
                  event.preventDefault();
                  event.stopPropagation();

                  return false;
               })

   $(".close, #extra_login").click(function() {
      $("#extra_login, #layer_popup").hide()
      $("input[type=text], input[type=password]").val('')
      document.getElementsByTagName('body')[0].style.overflow = ''
   })

   
   
   $(".review_img_data").on(function(){
      $(".review_img_data").attr('style', 'width: 100%');
   })
   
   $(".review_img_date").css({});
   
   $(".plus").attr('style', 'display: none');
        $(".minus").hide();

        $(".mobile_minus").hide();

        $(window).on('resize', function(){
            var width = window.innerWidth;
            if(width <= 710) {
                $(".plus").attr('style', 'display: inline-block')
            } else if(width > 710) {
                $(".plus").attr('style', 'display: none')
                $(".minus").attr('style', 'display: none')
                $(".foot_dropdown_menu").attr('style', 'visibility: visible')
            }

            if(width <= 850) {
                $(".footer_ele:eq(2)").attr('style', 'clear: both');
                $(".center").css({'display': 'inline'}, {'position': 'relative'}, {'left': '40%'}, {'transform': 'translateX(-30%)'});
            } else {
                $(".footer_ele:eq(2)").attr('style', 'clear: unset');
            }
        })


        $(".plus, .minus").mousedown(function(){
            
            var foot_class = $(this).attr('class')

            if(foot_class.split(' ', 3)[2] == "plus"){
                $(this).parent().children(".plus").attr('style', 'visibility: hidden')
                $(this).parent().children(".minus").attr('style', 'visibility: visible')
            } else if(foot_class.split(' ', 3)[2] == "minus"){
                $(this).parent().children(".plus").attr('style', 'visibility: visible')
                $(this).parent().children(".minus").attr('style', 'visibility: hidden')
            }
            $(this).parent().children("ul, p").stop().slideToggle();
        })

        $(".mobile_plus, .mobile_minus").mousedown(function(){
            
            var foot_class = $(this).attr('class')

            if(foot_class.split(' ', 3)[2] == "mobile_plus"){
                $(this).parent().children(".mobile_plus").attr('style', 'visibility: hidden')
                $(this).parent().children(".mobile_minus").attr('style', 'visibility: visible')
            } else if(foot_class.split(' ', 3)[2] == "mobile_minus"){
                $(this).parent().children(".mobile_plus").attr('style', 'visibility: visible')
                $(this).parent().children(".mobile_minus").attr('style', 'visibility: hidden')
            }
            $(this).parent().children("ul, p").stop().slideToggle();
        })
   
   $("#login_btn").click(function() {
      $("#extra_login, #layer_popup").hide()
      // if(아이디와 비밀번호가 맞을시) {
      // }
      document.getElementsByTagName('body')[0].style.overflow = ''
   })
   $("#top").click(function() {
      $("html, body").animate({
         scrollTop : '0'
      }, 800)
   })
   $("#copy_img_div").hide();

   $(window).scroll(function() {
      if ($(this).scrollTop() > 350) {
         $('#copy_img_div').fadeIn();
      } else {
         $('#copy_img_div').fadeOut();
      }
   });
   
   $("#mobile_bar").click(function(){
        $(this).toggleClass("is-active");
    });
        
    $("#mobile_menu").hide();
    $("#mobile_login").hide();
    $("#mobile_signup").hide();
    $("#mobile_logout").hide();
    $("#mobile_profile").hide();
    
    $("#mobile_bar").on('click', function(){
        $("#mobile_menu").toggle();
        $("#summary_info").toggle();
        $("#mobile_login").toggle();
        $("#mobile_signup").toggle();
        $("#mobile_logout").toggle();
        $("#mobile_profile").toggle(); 
        
        if($("#mobile_menu").css('display') == "none" ) {
            $("#mobile_menu").off();
            document.getElementsByTagName('body')[0].style.overflow = 'scroll';
        } else if($("mobile").css('display') != "none") {
            $("#nav").css('padding', '0px');
            $("#mobile_menu").on('scroll mousewheel touchmove', function(event){
                document.getElementsByTagName('body')[0].style.overflow = 'hidden';
                event.preventDefault();
                event.stopPropagation();
            })
        }
    })
    
    $("#mobile_logout").on('click', function(){
    	   var contextPath = "${pageContext.request.contextPath}";
       location.href="http://localhost:8787/Semi_Project_final/member.do?command=logout";
    })

    $("#mobile_login").on('click', function(){
        $("#layer_popup, #extra_login").toggle(); 
    })
})
