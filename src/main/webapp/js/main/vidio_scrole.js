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

function change_movie1(key,name){		
$("#frame").attr("src", `https://www.youtube.com/embed/${key}`);
$("#im2").html(`제목: ${name}`);
}


function movie_info(){
	// location.href = "delete.do?idx=" +f.idx.value;
	location.href = "movieinfo.do";
}



