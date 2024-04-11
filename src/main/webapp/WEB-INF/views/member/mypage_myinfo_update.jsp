<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
  #popup_image{
     width: 150px;
     height: 215px; 
     border: 2px solid gray;
     outline: 2px solid black;
  }
  #popup_image_box{
      float: left;
  }
  
  #popup_content_box{
      width: 400px;
      height:210px;
      /* border: 1px solid red; */  
      float: left;
  }

  #popup_content{
     width: 100%;
     min-height: 140px;
     border: 1px solid black;
     margin-left: 5px;
     padding: 5px;
     
     box-shadow: 1px 1px 1px #cccccc;
  }
  
  #popup_regdate, #popup_mem_name{
     width: 100%;
     min-height: 20px;
     border: 1px solid black;
     margin-left: 5px;
     margin-top: 5px;
     padding: 5px;
     box-shadow: 1px 1px 1px #cccccc;
  }
</style>

<script type="text/javascript">

  function del(){

	  if(confirm(modal_no + "정말 삭제하시겠습니까?")==false) return;
	  
	  //삭제
	  location.href="addr_delete.do?addr_idx=" + modal_addr_idx;
	  
  }//end:del()
  
  
  function modify(){
	  
	  location.href="addr_update.do?p_idx=" + modal_addr_idx;
	  
  }	 

  function insert_address(mem_idx){
              //로그인 여부 체크
     if("${ empty user }"=="true"){
         
         if(confirm("주소등록은 로그인후에 이용가능합니다\n로그인하시겠습니까?")==false) return;
         
         //로그인폼으로 이동 : 현재위치=> /photo/list.do
         location.href="login_form.do?mem_idx=" + mem_idx;
         return;
     }

     location.href="mypage_myinfo_insert.do";
    } 
	  
	  
  

</script>

</head>
<body>


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="popup_title">주소 수정</h4>
      </div>
      <div class="modal-body">
        <!-- <div id="popup_image_box">
            <img  id="popup_image" src="../upload/book1.jpg" width=150>
        </div> -->
        <div id="popup_content_box">
            <div id="popup_addr_idx">addr_idx</div> 
            <div id="popup_no">no</div> 
            <div id="popup_zipcode">우편번호</div> 
            <div id="popup_addr_street">주소</div> 
            <div id="popup_addr_detail">상세주소</div> 

           <!-- <div id="popup_content">내용....</div> 
           <div id="popup_regdate">2024-01-18</div> 
           <div id="popup_mem_name">홍길동</div>  -->
        </div>
      </div>
      <div class="modal-footer"  style="clear:both; text-align: center">
        
        <!-- <input id="btn_popup_download" type="button" class="btn btn-success" value="다운로드"
               onclick="download();" > -->
        <input id="btn_popup_update"   type="button" class="btn btn-info" value="수정"
               onclick="modify();">
        <input id="btn_popup_delete"   type="button" class="btn btn-danger" value="삭제"
               onclick="del();" >
        <input type="button" class="btn btn-warning" data-dismiss="modal" value="닫기">
        
      </div>
    </div>

  </div>
</div>


</body>
</html>