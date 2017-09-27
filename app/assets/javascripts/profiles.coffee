
namespace "Profile.ToolBar", (exports) ->
  icon_color_change = (color) ->
    console.log("border: 2px solid " + color)
    $("#icon").css(border: '2px solid ' + color)

  text_style_change = (style) ->
    console.log('font-weight', 'bold')
    $('.info name').css('font-weight', 'bold')


  exports.init = () ->
    console.log("we are here");
    $(".pr_action").on "click", ->
      $(this).parent().parent().css('color', "green");

    img_radion = $('input[type=radio][name=img]')
    console.log(img_radion)
    img_check  = $('input[type=checkbox][name=img_chek]')
    console.log(img_check)
    default_color = 'black'

    img_radion.change ->
      console.log("radio")
      value = $(this).val()
      check = img_check.prop('checked')
      if check
        icon_color_change(value)
      $.ajax 'http://localhost:3000/profiles/1',
        type: 'GET'
        dataType: 'html'
        data: 
          query: "Alpha"
        	 page:  3
        error: (jqXHR, textStatus, errorThrown) ->
            $('#result').append "AJAX Error: #{textStatus}"
        success: (data, textStatus, jqXHR) ->
            $('#result').append "Successful AJAX call: #{data}"

#изменение стиля текста
    text_style = $('input[type=checkbox][name=style]')

    text_style.click ->
      value = $(this).val()
      if value == 'bold'
        if $(this).is(":checked")
          $('p').css('font-weight', 'bold')
        else $('p').css('font-weight', 'normal')
      else if value == "italic"
        if $(this).is(":checked")
          $('p').css('font-style', 'italic')
        else $('p').css('font-style', 'normal')
      else if value == 'underline'
        if $(this).is(':checked')
          $('p').css('text-decoration', 'underline')
        else $('p').css('text-decoration', 'none')

#изменение размера такста
    text_size = $("input[type=radio][name=width]")

    text_size.change ->
      value = $(this).val()
      fontSize = $("p").css("fontSize")
      if $(this).is(":checked")
        console.log($("p").css("fontSize", fontSize ))
        $("p").css("fontSize", value + 'px' )

    
    img_check.change ->
      console.log("check")
      if this.checked
        value = default_color
        if img_radion.is(':checked') 
          value = $('input[type=radio][name=img]:checked').val() 
        icon_color_change value 
      else
        icon_color_change default_color
#запрет обновление страницы + новый div
    
    test_button = $("#button_a")
    copy_button = $('<input id="copy_button" type="button" value="Нажми меня нежно">')

    test_button.click (event) ->
      $('body').append('<div id="test_button" style="width:300px; height:400px; clear:both; background-color:yellow; border: 2px solid blue"><p>New DIV</p></div>')
      $('#button').append(copy_button)
      event.preventDefault()
      alert("Обновление страницы запрещено")
 
      copy_button.click ->
        #$('#test_button').is("body:last-child")
        $('body').prepand('#test_button')
        

    

#    request = new XMLHttpRequest()
#    
#    request.open('GET', 'http://localhost:3000/profiles/1', false)
#    request.setRequestHeader('X-Requested-With', 'XMLHttpRequest')  #// Tells server that this call is made for ajax purposes.
#  
#    request.onreadystatechange = () ->
#      DONE = 
#        if this.DONE
#          this.DONE
#        else
#          4
#      if (this.readyState == DONE)
#        $('#result1').append "Successful AJAX call: #{this.response}"
#      
#    request.send(null);  #// No data needs to be sent along with the request.
#// Most libraries like jQuery/Prototype/Dojo do this