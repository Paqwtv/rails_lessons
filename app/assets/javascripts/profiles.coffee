
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


    #homework
    set_css = (el, css) ->
      console.log(el)
      $(el).attr("style", css)

    link_tool = (el, css, tool) ->
      console.log("here1")
      $(tool).click (event) ->
        #get type of clicked element
        #if type check_box or radio use algorithm
        tag = event.target.nodeName
        type = $(event.target).attr("type")
        if tag == "INPUT" && (type == "radio" || type == 'checkbox')
          ch_b = $(tool).find('input[type=checkbox]')
          template = css[0]
          default_v = css[1]
          if ch_b.is(':checked')
            radio = $(tool).find('input[type=radio]:checked').val()
            cur_css = template.replace("value", radio)
            console.log(radio)
            console.log(cur_css)
            set_css(el, cur_css)
          else
            cur_css = template.replace("value", default_v )
            set_css(el, cur_css)
    #top
    css_template1 = ["font-size: valuepx", 13]
    css_template2 = ["value", "font-weight: normal; font-style: normal"]
    css_template3 = ["border: 2px solid valuepx", "black"]

    select1 = "p.info"
    select2 = "#vip p"
    select3 = "p.info.name"
    select4 = "p.info.s_name"
  

    link_tool(select1, css_template1, "#tool1")
    link_tool(select2, css_template2, "#tool2")
    link_tool(select3, css_template3, "#tool3")
    link_tool(select4, css_template2, "#tool4")