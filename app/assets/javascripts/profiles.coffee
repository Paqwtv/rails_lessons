
namespace "Profile.ToolBar", (exports) ->
  icon_color_change = (color) ->
    console.log("border: 2px solid " + color)
    $("#icon").css(border: '2px solid ' + color)


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

    img_check.change ->
      console.log("check")
      if this.checked
        value = default_color
        if img_radion.is(':checked') 
          value = $('input[type=radio][name=img]:checked').val() 
        icon_color_change value 
      else
        icon_color_change default_color