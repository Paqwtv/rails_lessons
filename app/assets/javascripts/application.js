// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require tools/namespace

//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .

$$a({
    type:'get',//тип запроса: get,post либо head
    url:'http://localhost:3000/profiles/1',//url адрес файла обработчика
    //data:{'q':'1'},//параметры запроса
    response:'text',//тип возвращаемого ответа text либо xml
    success:function (data) {//возвращаемый результат от сервера
        $$('result2',$$('result2').innerHTML+'<br />'+data);
    }
});
