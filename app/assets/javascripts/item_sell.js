$(function(){

  function buildHtml(src){
      let html = `
             <img src="${src}", style="width:100px; height: 100px">
            `
      return html
  }

  var file_field = document.querySelector('input[type = file]')
  $('.sell_image_content').change(function(){
    var file = $('input[type=file]').prop('files')[0];
    
    var fileReader = new FileReader();
        fileReader.onloadend = function(){
          var src = fileReader.result
          let html = buildHtml(src)
          $('.sell_image_area').append(html)
        }
        fileReader.readAsDataURL(file)
  })
  $('.sell_submit').click(function(e){
      
     e.preventDefault();
     let item_image = $('.sell_image_area').children('img');

  $.ajax({
    type: 'POST',
    url:  items_path,
    data: {img: item_image, }
  })
})
})