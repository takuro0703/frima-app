$(function() {

 function labelImg(src, id){
  
   let html = `
      <div class="edit_image_label">
      <img src="${src}", style="width:100px; height: 100px", class="edit-image">
       <input class="edit_image_content", type="file", name="item[images_attributes][${id}][image]">
       <span class="js-remove">削除</span>
      </div>
     `
    
     return html
 }

 function newLabel(id){
      let label = `
         <label class="edit_new_image_label", for="${id + 1}">
           <i class="fa fa-camera"></i>
           <input class="sell_image_content", id="${id+1}", type="file", name="item[images_attributes][${id}][image]">
          </label>
        `
        
    return label
 }

 function labelEditImg(src){
       let img = `
       <img src="${src}", style="width:100px; height: 100px", class="edit_image">
          `
          return img
 }

  $(document).on('change', '.edit_new_image_label', function(){
    let file = $('.edit_new_image_label > .sell_image_content').prop('files')[0]
    const for_id = Number($(this).attr('for'))

    let new_label = newLabel(for_id)
    $('.edit_image_field').append(new_label)
    
    
    var fileReader = new FileReader(for_id);
    fileReader.onloadend = function(for_id){
      var src = fileReader.result
      let html = labelImg(src, for_id)
      
      $('.edit_image_area').append(html)
    }
    fileReader.readAsDataURL(file)
  })




  $(document).on('click', '.edit_image', function(e){
    $(this).next().trigger('click')
    let file =  $(this).next().prop('files')[0]
    
    $(this).next().remove()

    var fileReader = new FileReader();
    fileReader.onloadend = function(){
      var src = fileReader.result
      let html = labelEditImg(src)
    
      $(".edit_image_label").append(html)
      
    }
    fileReader.readAsDataURL(file)
  })
})