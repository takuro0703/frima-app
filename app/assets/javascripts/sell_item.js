$(function(){
  $('.price_form-box').on('keyup', function(){   
    var data = $(this).val(); 
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




  function buildImg(src, id){
    
      let html = `
             <div class="sell_image_content">
             <img src="${src}"  style="width:100px; height: 100px" class="sell_preview_image" data-id="${id - 1}">
             <label class="image-edit", for="edit_${id - 1}">
               <span class="sell_image_edit">編集</span>
             </label>
             <span class="sell_image_delete">削除</span>
             </div>
            `
      return html
  }


  function buildEditImg(src, id){
    let html = `
    <div class="sell_img_content">
    <img src="${src}" , style="width:100px; height: 100px", class="sell_preview_image">
    <span class="sell_new_image_delete" data-index="${id - 1}">削除</span>
    </div>
   `
return html
  }

  function buildHtml(id){
      let html = `
             <input class="edit_image_content" id="edit_${id}" data-index="${id}" type="file" name="item[images_attributes][${id}][image]">
            `
       return html;
  }


  function buildSellHtml(id){
    let html = `
             <input class="sell_input_content" id="${id}"  type="file" name="item[images_attributes][${id}][image]">
            `
       return html;
  }

  $(document).on('change','.sell_input_content:last', function(){
    var node = $('.sell_input_content:last')
    var file = node.prop('files')[0];
    var id = Number($('.sell_image_label').attr('for'))
       new_id = id + 1;
    
      //  node[0].setAttribute('for', new_id);
      $('.sell_image_label').attr('for', `${new_id}`)
    let file_in = buildSellHtml(new_id);
    
    $('.sell_image').append(file_in);

    var fileReader = new FileReader();
        fileReader.onloadend = function(){
          var src = fileReader.result
          
          let html = buildEditImg(src, new_id)
          
          $('.sell_image_area').append(html)
        }
        fileReader.readAsDataURL(file)
  })



  $(document).on('change','.edit_image_content:last', function(){
    
    var file = $('input[type=file]:last').prop('files')[0];
    var node = $('.edit_image_content:last')
    var id = Number(node.attr('data-index'))
       new_id = id + 1;
    
      //  node[0].setAttribute('for', new_id);
      $('.sell_image_label').attr('for', `edit_${new_id}`)
    let file_in = buildHtml(new_id);
    
    $('.sell_image').append(file_in);

    var fileReader = new FileReader();
        fileReader.onloadend = function(){
          var src = fileReader.result
          
          let html = buildImg(src, new_id)
          
          $('.sell_image_area').append(html)
        }
        fileReader.readAsDataURL(file)
  })
  
  



  $(document).on('click', '.new_image_delete', function(e){
      $(this).parent().remove()
      let id = $(this).prev().attr('for')
     
      $(`input[type="file"]#${id}`).remove();
  })




  $(document).on('change', '.edit_image_content', function(e){
    debugger
    let file =  $(this).prop('files')[0]
    let input_name = $(this).attr('data-index')
   debugger
    let img_content = $(`img[data-id=${input_name}]`)
    var fileReader = new FileReader();
    fileReader.onloadend = function(){
      var src = fileReader.result
    
       img_content.attr('src', src)
    }
    fileReader.readAsDataURL(file)
  })



  //sellの削除機能

  $(document).on('click', '.sell_new_image_delete', function() {
    const targetIndex = $(this).data('index')
    
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[type="file"]#${targetIndex}.sell_input_content`)
    // もしチェックボックスが存在すればチェックを入れる
    debugger
    if (hiddenCheck) hiddenCheck.remove()
    $(this).parent().remove()
  });



  //editの削除機能

  $(document).on('click', '.sell_image_delete', function() {
    const targetIndex = $(this).prev().prev().data('id')
    
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-delete="${targetIndex}"].hidden-destroy`)
    // もしチェックボックスが存在すればチェックを入れる
   
    if (hiddenCheck) hiddenCheck.prop('checked', true)
    $(this).parent().remove()

    
  });


     $('.seller_form_content').submit(function(e){
      let image_area_contents = $('.sell_image_content')
      if (image_area_contents.length == 0){
       e.preventDefault();
       alert('画像をアップロードしてください')
      }
     })
   
})

