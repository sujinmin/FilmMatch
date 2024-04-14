<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 window.onload=function(){
      
	setTimeout(showMessage,200);
    
 };
 
 function showMessage(){
	 if("${param.error eq 'remain_not' }"=="true")
	 {
		 alert('재고목록에 출고할\n상품이 없습니다');
	 }
	
	 if("${param.error eq 'remain_lack' }"=="true")
	 {
		 alert('출고할 상품수량이 부족합니다');
	 } 
	 
	 if("${param.error eq 'remain_minus' }"=="true")
	 {
		 alert('해당 상품을 취소할 상품 수량이 재고목록의 상품수량보다 많습니다. 관리자에게 문의 하십시오');
	 }
	 
	 if("${param.error eq 'remain_empty' }"=="true")
	 {
		 alert('입고취소 할 상품이 재고목록에 존재하지 않습니다.관리자에게 문의 하십시오');
	 } 
	 
 }


	function delete_in(idx) {
		if(confirm("정말 입고를 취소하시겠습니까?")==false)return;
		
		location.href="delete_in.do?idx=" + idx;
	}
</script>
</head>
<body>

<table >
	<caption>::::입고목록::::</caption>
	<tr>
		<th width="25%">제품명</th>
		<th width="20%">수량</th>
		<th width="55%">입고일자</th>
	</tr>
	
	<c:if test="${ empty map.in_list }">
		<td colspan="3" align="center">
		   입고목록이 없습니다
		</td>
	</c:if>
	
	<c:forEach var="vo" items="${ requestScope.map.in_list }">
		<tr>
			<td width="30%">${ vo.name }</td>
			<td  width="20%">${ vo.cnt }</td>
<td style="white-space: normal;  display: flex; align-items: center;">
    <span style="margin-right: 10px;">${ vo.regdate }
	<img src="${ pageContext.request.contextPath }/image/xbutton.png" alt="Delete" style="width: 12px; height: 12px;" onclick="delete_in('${ vo.idx }');">
	<%-- <button type="button" onclick="delete_in('${ vo.idx }');" style="border: none; background: none;">
        
    </button> --%>
	</span>
    
</td>

		</tr>
	</c:forEach>
	
</table>


</body>
</html>