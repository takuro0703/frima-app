$(function(){




  function appendOption(child){
    let option = `
          <option value="${child.id}">${child.name}</option>
        `
        return option
  }


function appendParent(options){
  let select = `
      <select class="select-box select_category"  name="item[category_id]" id="item_category_id", required: true>   
      <option value>選択してください</option>
      ${options}
     </select>
      `
      $('.sell_category').append(select)
}


  function appendSelect(options){
      let select = `
          <select class="child_select select-box" name="item[category_id]" id="item_category_id", required: true>
           <option value>選択してください</option>
           ${options}
          </select>
          `
        $('.sell_category').append(select) 
  }



  function appendGrandchildSelect(options){
    let select = `
        <select class="grandchild_select select-box" name="item[category_id]" id="item_category_id", required: true>
         <option value>選択してください</option>
         ${options}
        </select>
        `
      $('.sell_category').append(select) 
}

$(document).on('click', '.parent_category', function(){
 
    $.ajax({
       url: '/items/category/get_category_parent',
       type: 'GET',
       dataType: 'json'
    })
    .done(function(parent){
      $('.parent_category').remove()
      $('.child_select').remove()
      $('.grandchild_select').remove()
        let innerHtml = '' 
        parent.forEach(function(p){
          innerHtml += appendOption(p)
        })
       appendParent(innerHtml)
    })
    .fail(function(){
      alert("カテゴリー取得に失敗しました")
    })

});


  $(document).on('change', '.select_category', function(){
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