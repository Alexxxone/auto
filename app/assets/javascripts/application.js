// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.validate.min
//= require login


$(document).ready(function(){
    if($('.alert.alert-dismissable').length > 0){
        window.setTimeout(function(){
            $('.alert.alert-dismissable').slideToggle();
        },3000)
    }
    $('.search_query').keyup(function(){
            send_request();
    });
    $('body').bind('click',function(){
        clear_response_box();
    });

   $('.navbar-form').submit(function(e){
       e.preventDefault();
       send_request();
   });
});

function build_response_box(response,box){
    box.empty().show();
    response.forEach(function(v,i){
        box.append("<li><a href='/customers/"+ v.id+"/payments'>"+ v.number_code +"</a><a class='btn btn-xs btn-success pull-right' type='button' href='/customers/"+ v.id+"/payments/new'>Новый Заказ</a> "+v.name+"</li>")
    })
}
function clear_response_box(){
    if(!$('.response_box').is(":hover")){
        $('.response_box').empty();
    }
}
function send_request(){
    var number_code = $('.search_query').val();
    var box = $('.response_box');
    box.hide();
    $.ajax({
        url:'/find_number_code',
        dataType:'json',
        type: 'post',
        data: {number_code: number_code}
    }).success(function(response){
            build_response_box(response,box);
    });
}