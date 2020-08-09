$(function(){

  function appendOption(child){
    let option = `
          <option value="${child.id}">${child.name}</option>
        `
        return option
  }



  function appendSelect(options){
      let select = `
          <select class="child_select select-box" name="item[category_id]" id="item_category_id">
           <option value>選択してください</option>
           ${options}
          </select>
          `
        $('.sell_category').append(select) 
  }



  function appendGrandchildSelect(options){
    let select = `
        <select class="grandchild_select select-box" name="item[category_id]" id="item_category_id">
         <option value>選択してください</option>
         ${options}
        </select>
        `
      $('.sell_category').append(select) 
}



  $('.select_category').on('change', function(){
    var id = $(this).attr('id')
    var name = $(this).attr('name')
    var val = $(this).val()
   
    if (val != ""){
      $.ajax({
         url: '/items/category/get_category_children',
         type: 'GET',
         data: {data_id: val},
         dataType: 'json'
      })
      .done(function(children){
     $('.child_select').remove()
      $('.grandchild_select').remove()
        let innerHtml = '' 
        children.forEach(function(child){
          innerHtml += appendOption(child)
        })
        appendSelect(innerHtml)
      })
      .fail(function(){
        alert("カテゴリー取得に失敗しました")
      })
    }
    else{
      $('.child_select').remove()
      $('.grandchild_select').remove()
    }
  });



  $(document).on('change','.child_select', function(){
    var id = $(this).attr('id')
    var val = $(this).val()
    var c = $(this)
    if (val != ""){
      
      $.ajax({
         url: '/items/category/get_category_grandchildren',
         type: 'GET',
         data: {data_id: val},
         dataType: 'json'
      })
      .done(function(grandchildren){
        $('.grandchild_select').remove()
        let innerHtml = '' 
        grandchildren.forEach(function(grandchild){
          innerHtml += appendOption(grandchild)
        })
        appendGrandchildSelect(innerHtml)
      })
      .fail(function(){
        alert("カテゴリー取得に失敗しました")
      })
    }
    else{
      $('.grandchild_select').remove()
    }
  })
})