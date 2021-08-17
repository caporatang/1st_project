/**
 * 
 */

$(function() {
    
    // 메뉴 호버 효과
    $('.total_menu').mouseenter(function (e) { 
        e.preventDefault();
        if ($('.sub_nav').hasClass('on')) {
            $('.sub_nav').removeClass('on');
        }else{//hover클래스를 가지고 있지 않다면.
            $('.sub_nav').addClass('on')
        }    
    })

    $('.total_menu').mouseleave(function (e) { 
        e.preventDefault();
            $('.sub_nav').removeClass('on');
    })

    $('ul.sub_gnb li').mouseenter(function (e) { 
        e.preventDefault();
        if ($(this).hasClass('on')) {
            $(this).removeClass('on');
        }else{//hover클래스를 가지고 있지 않다면.
            $(this).addClass('on')
        }    

        if ($('.total_menu').hasClass('on')) {
            $('.total_menu').removeClass('on');
        }else{//hover클래스를 가지고 있지 않다면.
            $('.total_menu').addClass('on')
        }   
    })

    $('ul.sub_gnb li').mouseleave(function () { 
        $(this).removeClass('on');
    });
    


})