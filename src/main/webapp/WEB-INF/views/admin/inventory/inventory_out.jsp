<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function delete_out(idx) {
		if(confirm("정말 출고를 취소하시겠습니까?")==false)return;
		
		location.href="delete_out.do?idx=" + idx;
	}
	
</script>

</head>
<body>

<table>
	<caption>::::출고목록::::</caption>
	<tr>
		<th width="25%">제품명</th>
		<th width="20%">수량</th>
		<th width="55%">출고일자</th>
	</tr>
	
	<c:if test="${ empty map.out_list }">
		<td colspan="3" align="center">
		   출고목록이 없습니다
		</td>
	</c:if>
	
	<c:forEach var="vo" items="${ map.out_list }">
		<tr>
			<td>${ vo.name }</td>
			<td>${ vo.cnt }</td>
			<td style="white-space: normal;  display: flex; align-items: center;">
    <span style="margin-right: 10px;">${ vo.regdate }
	<img src="${ pageContext.request.contextPath }/image/xbutton.png" alt="Delete" style="width: 12px; height: 12px;" onclick="delete_out('${ vo.idx }');">
	<%-- <button type="button" onclick="delete_in('${ vo.idx }');" style="border: none; background: none;">
        
    </button> --%>
	</span>
    
</td>

		</tr>
	</c:forEach>
	
</table>


</body>
</html>