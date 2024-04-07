<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<head>

<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/main.css"></head><body> -->

<title>FilmFlow - 영화, 책 ,TV프로그램 추천 및 평가 서비스</title>
 <style>
body {
		position: relative;
		padding-top: 5em;
	}
	@font-face {
		font-family: 'EF_jejudoldam';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-EF@1.0/EF_jejudoldam.woff2')
			format('woff2');
		font-weight: normal;
		font-style: normal;
	}
	@font-face {
		font-family: 'WAGURITTF';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2403@1.0/WAGURITTF.woff2') format('woff2');
		font-weight: normal;
		font-style: normal;
	}
	
	@font-face {
		font-family: 'TTHakgyoansimUndongjangL';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2402_keris@1.0/TTHakgyoansimUndongjangL.woff2') format('woff2');
		font-weight: 300;
		font-style: normal;
	}
	.film {
		
		font-size: 40px;
		color: white;
		font-family: 'EF_jejudoldam';
	}
	/* Flow의 색상을 분홍색으로 지정 */
	.flow {
		font-size: 40px;
		color: #33ccff;
		font-family: 'EF_jejudoldam';
	}
	#header {
		background: black;
		color: #d5d5d5;
		cursor: default;
		height: 5em;
		left: 0;
		line-height: 5em;
		position: fixed;
		text-align: right;
		top: 0;
		width: 100%;
		z-index: 10001;
	}

		#header .inner {
			max-width: 65em;
			width: calc(100% - 6em);
			margin: 0 auto;
			position: relative;
		}

			@media screen and (max-width: 480px) {

				#header .inner {
					max-width: 90%;
					width: 90%;
				}

			}

		#header .logo {
			font-family: 'Pacifico', cursive;
			display: inline-block;
			height: inherit;
			left: 0;
			line-height: inherit;
			margin: 0;
			padding: 0;
			position: absolute;
			top: 0;
			color: #e5474b;
			font-size: 1.75em;
			text-transform: none;
			font-weight: normal;
			padding: 0;
		}

			#header .logo:hover {
				color: rgba(229, 71, 75, 0.75);
			}

		#header a {
			-moz-transition: color 0.2s ease-in-out;
			-webkit-transition: color 0.2s ease-in-out;
			-ms-transition: color 0.2s ease-in-out;
			transition: color 0.2s ease-in-out;
			display: inline-block;
			padding: 0 1em;
			color: #33ccff;
			text-decoration: none;
			text-transform: uppercase;
			font-weight: 700;
			font-size: 1em;
		}

			#header a:hover {
				color: white;
			}

			#header a:last-child {
				padding-right: 0em;
			}

			@media screen and (max-width: 736px) {

				#header a {
					padding: 0 0.5em;
				}

			}

	@media screen and (max-width: 480px) {

		#header {
			min-width: 320px;
		}

	}

 </style>
</head>
<!-- Header -->
		<header id="header"><div class="inner">
					<a href="${pageContext.request.contextPath}/index.do" class="logo"><span class="film">Film</span><span class="flow">Match</span></a>
					<nav id="nav"><a href="${pageContext.request.contextPath}/member/login_form.do">Login</a>
						<a href="${pageContext.request.contextPath}/mypage_form.do">Mypage</a>
                        <a href="${pageContext.request.contextPath}/admin/main.do">Admin</a>
						<a href="${pageContext.request.contextPath}/support/support_home.do">Support</a>
                        
					</nav></div>
			</header>
			