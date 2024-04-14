<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html>

<head>
<title>Generic - Introspect by TEMPLATED</title>
<meta charset="utf-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="assets/css/main.css">
 <!-- DAUM 주소검색 API -->
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

 <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

 <style>

 </style>

<script type="text/javascript">

        
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


















<!-- Modal -->
<!-- ㅇㅇㅇㅇㅇㅇㅇ -->
<div id="insert_modal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

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
                <input type="hidden" id="mem_idx" value="${ user.mem_idx}">
                <tr>
                    <th colspan="2">${ vo.mem_name }님의 주소등록 </th>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <tb>
                        <input class="form-control" type="text" name="addr_zipcode" id="addr_zipcode" value="${ vo1.zipcode }">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="btn btn-info" type="button" value="주소검색" onclick="find_addr();">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </tb>
                </tr>
                <tr>
                    <th>주소</th>
                    <tb><input type="text" id="addr_street" value="${ vo1.addr_street}"></tb>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <tb><input type="text" id="addr_detail" value="${ vo1.addr_detail }"></tb>
                </tr>
            </table>
          </form>
        <!-- </div>
          <div id="popup_content_box">
              <div id="popup_addr_idx">addr_idx</div> 
              <div id="popup_no">no</div> 
              <div id="popup_zipcode">우편번호</div> 
              <div id="popup_addr_street">주소</div> 
              <div id="popup_addr_detail">상세주소</div>  -->

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

        </div><!-- class="modal fade" -->
  
    </div>
  </div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script><script src="assets/js/skel.min.js"></script><script src="assets/js/util.js"></script><script src="assets/js/main.js"></script></body></html>
