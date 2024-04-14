/**
 * 
 */
$(document).ready(function() {
	
});

function moveImage_left(){
$("#boxb").animate({"left":"-=100"},100, function(){
	// 현재 left속성값 얻기
	var left = parseInt($("#boxb").css("left"));
	console.log(left);
	if(left <  -1500){
		// 오른쪽에서 다시 나오게 하기 
		$("#boxb").css("left","0px");
	}
});
}

function moveImage_right(){
$("#boxb").animate({"left":"+=100"},100, function(){
	// 현재 left속성값 얻기
	var left = parseInt($("#boxb").css("left"));
	console.log(left);
	if(left >  0){
		// 왼쪽에서 다시 나오게 하기 
		$("#boxb").css("left","-1500px");
	}
});
}

function moveImage_leftf(){
$("#boxf").animate({"left":"-=100"},100, function(){
	// 현재 left속성값 얻기
	var left = parseInt($("#boxf").css("left"));
	console.log(left);
	if(left <  -1500){
		// 오른쪽에서 다시 나오게 하기 
		$("#boxf").css("left","0px");
	}
});
}

function moveImage_rightf(){
$("#boxf").animate({"left":"+=100"},100, function(){
	// 현재 left속성값 얻기
	var left = parseInt($("#boxf").css("left"));
	console.log(left);
	if(left >  0){
		// 왼쪽에서 다시 나오게 하기 
		$("#boxf").css("left","-1500px");
	}
});
}

function change_movie1(key){		
$("#frame").attr("src", `https://www.youtube.com/embed/${key}`);
//$("#im2").html(`제목: ${name}`);
}


function movie_info(id,media_type) {
    var url = "movieinfo.do?id=" + id +"&media_type=" + media_type;
    window.location.href = url;
}

function showSearchText() {
    // 폼으로부터 입력된 텍스트 가져오기
    var searchText = document.querySelector('.search-text').value;
    // // 가져온 텍스트를 어딘가에 표시하거나 활용할 수 있습니다.

	window.location.href = "searchmovie.do?query=" + encodeURIComponent(searchText);
}
	


