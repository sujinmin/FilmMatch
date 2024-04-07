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
$(document).ready(function() {

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


	// 사용자가 이미지를 임시로 업로드 했을 경우, 임시로 보여주는 코드
       $('#fileInput').change(function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function() {
                const imagePreview = $('#imagePreview');
                imagePreview.empty();
                const imgElement = $('<img>');
                imgElement.attr('src', reader.result);
                imgElement.css('width', '300px'); // 너비 고정
                imgElement.css('height', '300px'); // 높이 고정
                imagePreview.append(imgElement);
            }
            reader.readAsDataURL(file);
        } else {
            // 파일이 선택되지 않았을 때, 기본 이미지.
            const imagePreview = $('#imagePreview');
            imagePreview.empty();
            const imgElement = $('<img id="upload_img">');
            imgElement.attr('src', '${pageContext.request.contextPath}/upload/No-image-found.jpg');
            imgElement.css('width', '300px'); // 너비 고정
            imgElement.css('height', '300px'); // 높이 고정
            imagePreview.append(imgElement);
        }
    });
    
    $(function() {
		CKEDITOR.replace('goods_contents',{
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
		

	
	});
});
	
	function send(f) {
		// let goods_contents = CKEDITOR.instances.goods_contents.getData();
		var cate_id= $('#cate_id').val();
		var cate_sub_id=$('#cate_sub_id').val();
		var goods_price=f.goods_price.value.trim();
		var goods_quantity=f.goods_quantity.value.trim();
		var photo=f.photo.value.trim();
		var goods_name=f.goods_name.value.trim();

		

          if (goods_name=='') {
              alert('상품명을 입력하세요!')
              f.goods_name.value='';
              f.goods_name.focus();
              return;
          }


          if (cate_id=='') {
              alert('대분류를 선택하세요!')
			  f.cate_id.focus();
              return;
          }

		  if (cate_sub_id=='') {
              alert('소분류를 선택하세요!')
			  f.cate_sub_id.focus();
              return;
          }

		    if (goods_price=='') {
              alert('상품가격을 입력하세요!')
              f.goods_price.value='';
              f.goods_price.focus();
              return;
          }


    	if (goods_quantity=='') {
              alert('상품수량을 입력하세요!')
              f.goods_quantity.value='';
              f.goods_quantity.focus();
              return;
          }

		  if (photo=='') {
              alert('대표이미지를 업로드 하세요');
			  f.photo.focus();
              return;
          }

		
		
		f.action = "/goods/insert.do"; 
		f.submit();
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
	<h1>상품 등록</h1>
	<form method="POST" enctype="multipart/form-data">
	<input type="hidden" value="1" name="mem_idx">
	<table class="table">
	<tr>
	<th>제목</th><td colspan="5"><input type="text" name="goods_name" id="goods_name" style="width: 80%"></input></td>
	
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
		<td><input type="number" style="width: 30%" name="goods_price"></td>
		
	</tr>
	<tr>
	<th style="text-align: right;">할인률</th>
		<td><input type="number" style="width: 30%" name="goods_rate"></td>
	</tr>

	<th style="text-align: right;">할인금액</th>
		<td><input type="number" style="width: 30%" name="goods_rate_price"  readonly></td>
	</tr>

	
	<tr>
	<th style="text-align: right;">재고수량</th>
		<td><input type="number" style="width: 30%" name="goods_quantity"></td>
	</tr>
	<tr>
	
	<th style="text-align: right;"> 상품 출시일자</th>
		<td style="text-align: left;"><input type="date" style="width: 80%" name="release_date"></td>
		<th style="text-align: right;"> 제조사(임시)</th>
		<td style="text-align: left;"><input type="text" style="width: 80%" name="goods_brand"></td>
	</tr>
	
	<tr>
	<th style="text-align: right;"> 상품 판매기간</th>
		<td style="text-align: left;"><input type="date"  name="sale_start_date"> ~ <input type="date"  name="sale_end_date"></td> 
		<th style="text-align: right;"> 제조국가</th>
		<td style="text-align: left;"><input type="text"  name="country"></td> 
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
	<td><input type="file" id="fileInput" name="photo"></td>
	<td colspan="5"><div id="imagePreview" ><img id="upload_img" src="${pageContext.request.contextPath}/upload/No-image-found.jpg"></div></td>
	</tr>
	<tr>
		<td colspan="6"><textarea name="goods_contents" id="goods_contents"></textarea></td>
	</tr>	
		
	<tr>
	<td colspan="6" style="text-align: right;">
	<p>
			<input type="button" class="btn btn-primary" value="상품 등록" onclick='send(this.form);'>
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