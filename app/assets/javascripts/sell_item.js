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
    var node = $('.sell_image_label')
    var id = Number(node.attr('for'))
       node.removeAttr('for')
       new_id = id + 1;
       node[0].setAttribute('for', new_id);
    
       
    var fileReader = new FileReader();
        fileReader.onloadend = function(){
          var src = fileReader.result
          let html = buildHtml(src)
          $('.sell_image_area').append(html)
        }
        fileReader.readAsDataURL(file)
  })
  

})
