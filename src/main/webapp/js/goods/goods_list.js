

function search(){
  var  search_text = $("#search_text").val();
  var  search_option = $("#search_option").val();
  

  //전체검색이 아닌데 검색어가 비어있는 경우
	if(search_option!='all' && search_text==''){
        alert('검색어를 입력하세요!');
        $("#search_text").focus();
        return;
    }

    location.href='list.do?search_option='+search_option+"&search_text=" + encodeURIComponent(search_text);

}