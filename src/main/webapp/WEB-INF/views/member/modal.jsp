<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
     <!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- DAUM 주소검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    $(document).ready(function(){
      $('#testBtn').click(function(e){
          e.preventDefault();
          $('#testModal').modal("show");
      });
    });

    function find_addr() {
		new daum.Postcode({
	        oncomplete: function(data) { //json
	        	//data = {"zonecode":"13529", "address":"경기 성남시 분당구",..."}
	        	// 주소창에서 선택된 주소값을 입력창에 넣어준다
	        	$("#addr_zipcode").val(data.zonecode);
	        	$("#addr_street").val(data.roadAddress);
	        
	        }
	    }).open();
		
	} //end: fine_addr()
  </script>

</head>
<body>
  <button id="testBtn" class="btn">모달 테스트</button>

  <!-- 회원가입 확인 Modal-->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

              <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title" id="popup_title">주소 등록</h2>
        </div>
        <div class="modal-body">
          <form>
            <table>
                <input type="hidden" id="mem_idx" value="${ user.mem_idx }">
                <tr>
                    <th colspan="2">${ vo.mem_name }님의 주소등록 </th>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <tb>
                        <input class="form-control" type="text" name="addr_zipcode" id="addr_zipcode" value="${ vo.addr_zipcode }">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="btn btn-info" type="button" value="주소검색" onclick="find_addr();">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </tb>
                </tr>
                <tr>
                    <th>주소</th>
                    <tb><input type="text" id="addr_street" value="${ vo.addr_street}"></tb>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <tb><input type="text" id="addr_detail" value="${ vo.addr_detail }"></tb>
                </tr>
            </table>
          </form>

          </div>
        </div>
        <div class="modal-footer"  style="clear:both; text-align: center">
          
          <!-- <input id="btn_popup_download" type="button" class="btn btn-success" value="다운로드"
                 onclick="download();" > -->
          <input id="btn_popup_update"   type="button" class="btn btn-info" value="주소등록"
                 onclick="addr_insert(this.form);">

          <input type="button" class="btn btn-warning" data-dismiss="modal" value="닫기">
          
        </div>
    </div>





	</div>
	


	

</body>
