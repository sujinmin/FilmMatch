<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">
<head>
<!DOCTYPE html>
<html lang="en">
<head>
<%-- aaaaaaaaaaaaaaaaaa --%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="${ pageContext.request.contextPath }/image/ban.png" />
<link rel="apple-touch-icon" href="${ pageContext.request.contextPath }/image/ban.png" />
<link rel="apple-touch-icon" sizes="180x180" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="icon" type="image/png" sizes="32x32" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="manifest" href="../image/ban.png">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/main/main.css">
<script src="${ pageContext.request.contextPath }/js/main/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/skel.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/util.js"></script>
<script src="${ pageContext.request.contextPath }/js/main/main.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="icon" href="${ pageContext.request.contextPath }/image/ban.png" />
<link rel="apple-touch-icon" href="${ pageContext.request.contextPath }/image/ban.png" />
<link rel="apple-touch-icon" sizes="180x180" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="icon" type="image/png" sizes="32x32" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.request.contextPath }/image/ban.png">
<link rel="manifest" href="${ pageContext.request.contextPath }/image/ban.png">
<link href="${ pageContext.request.contextPath }/css/goods/goods_insert.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 등록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>

<script type="text/javascript">
 
 var originalData;
$(document).ready(function() {


 

    var cate_sub_id = "${cate_sub_id}"; 
    var cate_main_id = "${cate_main_id}"; 

	var able_minors_buy="${goodsvo.able_minors_buy}";



	 // 상품가와 할인율 입력 필드에 이벤트 리스너 추가
  $('input[name="goods_price"], input[name="goods_rate"]').on('input', function() {
    // 상품가와 할인율 값 가져오기
    var price = parseFloat($('input[name="goods_price"]').val());
    var rate = parseFloat($('input[name="goods_rate"]').val());
    // 할인금액 계산 (소수점 이하 버림)
    var discountAmount = Math.floor(price * (rate / 100));
    // 최종 할인금액 계산
    var finalPrice = price - discountAmount;
    // 할인금액 입력 필드에 값 설정
    $('input[name="goods_rate_price"]').val(finalPrice);
  });


	$('#cate_id').val(cate_main_id); // 카테고리 메인 아이디를 선택
	//console.log(able_minors_buy);
	// 해당 상품 미성년자 구입 가능한 경우
 	 if (able_minors_buy == 1) {
        $('#true').prop('checked', true); // '구입 가능' 라디오 버튼 선택
    } else {
        $('#false').prop('checked', true); // '구입 불가' 라디오 버튼 선택
    }

	// 카테고리 가져오기(이미 이전에 선택된 값을 다시 가져오기위한 처리)
   if(cate_main_id!=''){

	var $subCate = $('#cate_sub_id');
    $subCate.empty();  // 먼저 모든 옵션을 제거
	 $.ajax({
        url: 'getSubcategories.do',
        type: 'GET',
        dataType: "json",
        data: { cate_parent_id: cate_main_id },
        success: function(data) {
            $.each(data.cate_sub_list, function(index, item) {
                $subCate.append('<option value="' + item.cate_id + '">' + item.cate_sub + '</option>');

            });
			// AJAX 요청 완료 후 실행되어야 할 코드
			 $('#cate_sub_id').val(cate_sub_id); // 카테고리 서브 아이디를 선택
        }
    });
   }


	// 서브 카테고리를 가져오기 위한 ajax 처리
  $('#cate_id').change(function() {
    var cate_id = $(this).val();
    var $subCate = $('#cate_sub_id');
    $subCate.empty();  // 먼저 모든 옵션을 제거

    // 아무것도 선택하지 않은 경우 리턴 처리
    if(cate_id == '') return;

    $.ajax({
        url: 'getSubcategories.do',
        type: 'GET',
        dataType: "json",
        data: { cate_parent_id: cate_id },
        success: function(data) {
            $.each(data.cate_sub_list, function(index, item) {
                $subCate.append('<option value="' + item.cate_id + '">' + item.cate_sub + '</option>');
				
            });
        }
    });
	});


    $(function() {
		    editor = CKEDITOR.replace('goods_contents',{
			filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do',
			removePlugyins:'save',
			height: 1300,
			resize_enabled: false ,// 사용자가 에디터의 크기를 조절하는 것을 차단
			
			
			// 툴바 기능 설정(저장기능, 최대화 기능 비활성화)
				 toolbar: [
				        { name: 'document', items: [ 'Source', '-', 'Preview', '-', 'Templates' ] }, // Save 버튼 제거
				        { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
				        { name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
				        { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
				        '/',
				        { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
				        { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
				        { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
				        { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
				        '/',
				        { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
				        { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
				        { name: 'tools', items: [ 'ShowBlocks' ] }, // Maximize 버튼 제거
				        { name: 'about', items: [ 'About' ] }
				    ]
		});
		
 // CKEditor가 준비된 후에 원본 데이터를 저장하고 이벤트 리스너를 추가 
 // 삭제된 사진과 수정된 사진이 존재하는지를 판단
        editor.on('instanceReady', function() {
             originalData = editor.getData();

            var editButton = document.getElementById('update_btn');
       editButton.addEventListener('click', function() {
    var currentData = editor.getData();

    var originalImgTags = originalData.match(/<img[^>]*>/g) || [];
    var currentImgTags = currentData.match(/<img[^>]*>/g) || [];

    var deletedImgTags = originalImgTags.filter(tag => !currentImgTags.includes(tag));
    var addedImgTags = currentImgTags.filter(tag => !originalImgTags.includes(tag));

    // 파일명만 추출
    var deletedFilenames = deletedImgTags.map(tag => tag.match(/\/resources\/ckimage\/(.*?)" /)[1]);
    var addedFilenames = addedImgTags.map(tag => tag.match(/\/resources\/ckimage\/(.*?)" /)[1]);

    // 파일명을 콘솔에 출력
    console.log('Deleted:', deletedFilenames);
    console.log('Added:', addedFilenames);

    // 폼 요소를 선택하거나 생성
    var form = document.getElementById('update_form'); 

    // 숨겨진 입력 필드를 생성하여 폼에 추가
    deletedFilenames.forEach(function(filename) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'deletedFilenames';
        input.value = filename;
        form.appendChild(input);
    });

    addedFilenames.forEach(function(filename) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'addedFilenames';
        input.value = filename;
        form.appendChild(input);
    	});

    		// 폼을 서버로 제출
		    form.action = "/goods/update.do"; 
    		form.submit();
			});

        });
    });
});
	



function ajaxFileUpload() {
    // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
    $("#ajaxFile").click();
}

function photo_upload() {

	//파일선택->취소시,내부적으로 배열처리(ajax상 에서 쓰이는 형식!이 부분은 그냥 이해하지 말것!)
	if( $("#ajaxFile")[0].files[0]==undefined)return; 
	   
	   	   
	var form = $("ajaxForm")[0];
        var formData = new FormData(form);
        //JSON 형태의 데이터를 집어넣기
        formData.append("goods_idx", '${ goodsvo.goods_idx }');
        formData.append("photo", $("#ajaxFile")[0].files[0]);
        
   

       $.ajax({
             url : "photo_upload.do", //PhotoUploadAction
             type : "POST",
             data : formData,//{"p_idx":p_idx}
             processData : false, //파일 보낼때의 ajax 형식
             contentType : false, //파일 보낼때의 ajax 형식
             dataType : 'json',
             success:function(result_data) {
            	
            	 
            	 $("#upload_img").attr("src","../upload/" + result_data.image_url);
             },
             error : function(err){
            	 alert(err.responseText);
             }
       });
 }


</script>
<meta charset="utf-8">
<title>굿즈 상품 등록</title>

</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/header.jsp"/>
	


	<section id="one">
	<div>
<div id="insert_box">
	<h1>상품 정보 수정</h1>
	<form method="POST" enctype="multipart/form-data" id="ajaxForm" >
	  <input id="ajaxFile" type="file"  style="display:none;"  onChange="photo_upload();" >
	</form>
	<form id="update_form">
	<%-- 이전 이미지정보 --%>
	<input type="hidden" value="${goodsvo.goods_idx}"  name="goods_idx">
	<input type="hidden" value="1" name="mem_idx">
	<table class="table">
	<tr>
	<th>제목</th><td colspan="5"><input type="text" name="goods_name" id="goods_name" style="width: 80%" value="${goodsvo.goods_name}"></input></td>
	
	</tr>
	<tr><th>카테고리 분류</th>
		<td colspan="4">
	대분류
			<select  id="cate_id" style="width:30%">
			<option value="">대분류를 선택하세요</option>
				<c:forEach var="vo" items="${result_map.cate_top_list}">
		
						<option value="${vo.cate_id}">${vo.cate_sub}</option>
				
				</c:forEach>
			</select>

	소분류
			<select name="cate_id" id="cate_sub_id" style="width:30%">
				
			</select>
		</td>
	</tr>
	<tr>
		<th style="text-align: right;">상품가</th>
		<td><input type="text" style="width: 30%" name="goods_price" value="${goodsvo.goods_price}"></td>
		
	</tr>
	<tr>
	<th style="text-align: right;">할인률</th>
		<td><input type="text" style="width: 30%" name="goods_rate" value="${goodsvo.goods_rate}"></td>
	</tr>

	<th style="text-align: right;">할인금액</th>
		<td><input type="number" style="width: 30%" name="goods_rate_price" value="${goodsvo.goods_rate_price}"  readonly></td>
	</tr>



	<tr>
	<th style="text-align: right;">재고수량</th>
		<td><input type="text" style="width: 30%" name="goods_quantity" value="${goodsvo.goods_quantity}" ></td>
	</tr>
	<tr>
	
	<th style="text-align: right;"> 상품 출시일자</th>
		<td style="text-align: left;"><input type="date" style="width: 80%" name="release_date"  value="${goodsvo.release_date}" ></td>
		<th style="text-align: right;"> 제조사(임시)</th>
		<td style="text-align: left;"><input type="text" style="width: 80%" name="goods_brand" value="${goodsvo.goods_brand}" ></td>
	</tr>
	
	<tr>
	<th style="text-align: right;"> 상품 판매기간</th>
		<td style="text-align: left;"><input type="date"  name="sale_start_date" value="${goodsvo.sale_start_date}"> ~ <input type="date"  name="sale_end_date"  value="${goodsvo.sale_end_date}"></td> 
		<th style="text-align: right;"> 제조국가</th>
		<td style="text-align: left;"><input type="text"  name="country" value="${goodsvo.country}" ></td> 
	</tr>
	<th style="text-align: right;"> 미성년자 구입 가능여부</th>
	<td>
		<input type="radio" id="true" name="able_minors_buy" value="1" checked><label for="true">구입 가능</label>
		<input type="radio" id="false"  value="0" name="able_minors_buy"><label for="false">구입 불가</label>
	</td>
	<tr>
	
	</tr>

	<tr>
	<th>대표이미지</th>
	<td> <input class="btn btn-primary" type="button" value="이미지수정" onclick="ajaxFileUpload();"></td>
	<td colspan="5"><div id="imagePreview" ><img id="upload_img" src="${pageContext.request.contextPath}/upload/${goodsvo.image_url}"></div></td>
	</tr>
	<tr>
		<td colspan="6"><textarea name="goods_contents" id="goods_contents">${goodsvo.goods_contents} </textarea></td>
	</tr>	
		
	<tr>
	<td colspan="6" style="text-align: right;">
	<p>
		<input type="button" class="btn btn-primary" value="상품 정보 수정"  id="update_btn">
	</p>
	</td>
	</tr>	
		
		</table>
	</form>
</div>
</div>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/main/footer.jsp"/>
</body>
</html>