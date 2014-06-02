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
//= require_tree .



$(document).ready(function(){
    if($('.alert.alert-dismissable').length > 0){
        window.setTimeout(function(){
            $('.alert.alert-dismissable').slideToggle();
        },3000)

    }
    $('.search_query').keyup(function(){
        var number_code = this.value;
        window.setTimeout(function(){
            var box = $('.response_box');
            console.log(number_code);
            box.hide();
            $.ajax({
                url:'/find_number_code',
                dataType:'json',
                type: 'post',
                data: {number_code: number_code}
            }).success(function(response){
                build_response_box(response,box);
            });
        },500)
    });

});
function build_response_box(response,box){

    box.empty().show();
    response.forEach(function(v,i){
        box.append("<li><a href='/customers/"+ v.id+"/payments'>"+ v.number_code +"</a><a class='btn btn-xs btn-success' type='button' href='/customers/"+ v.id+"/payments/new'>Новый Заказ</a> "+v.name+"</li>")
    })
}