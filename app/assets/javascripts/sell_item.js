$(function(){
  $('#price_calc').on('input', function(){   
    var data = $('#price_calc').val(); 
    var profit = Math.round(data * 0.9)  
    var fee = (data - profit) 
    $('.right_bar').html(fee) 
    $('.right_bar').prepend('¥') 
    $('.right_bar_2').html(profit)
    $('.right_bar_2').prepend('¥')
    $('#price').val(profit) 
    if(profit < 270 || profit > 8999999) {   
    $('.right_bar_2').html('');
    $('.right_bar').html('');
    }
  })

  function buildImg(src){
      let html = `
             <img src="${src}", style="width:100px; height: 100px">
            `
      return html
  }

  function buildHtml(id){
      let html = `
             <input class="sell_image_content", id="${id}", type="file", name="item[images_attributes][${id - 1}][image]">
       `
       return html;
  }

  $('.sell_image_label').on('change','.sell_image_content', function(){
    var file = $('input[type=file]:last').prop('files')[0];
    var node = $('.sell_image_label')
    var id = Number(node.attr('for'))
       node.removeAttr('for')
       new_id = id + 1;
       node[0].setAttribute('for', new_id);
     
    let file_in = buildHtml(new_id);
    
    $('.sell_image_label').append(file_in);

    var fileReader = new FileReader();
        fileReader.onloadend = function(){
          var src = fileReader.result
          let html = buildImg(src)
          
          $('.sell_image_area').append(html)
        }
        fileReader.readAsDataURL(file)
  })
  

})
