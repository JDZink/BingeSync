<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BingeSync > ${user.username}'s&nbspProfile</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Monda:400,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Transparent-Navigation-with-animation-on-scroll.css">
    <link rel="stylesheet" href="assets/css/Transparent-Navigation-with-animation-on-scroll1.css">
</head>

<body>
    <div id="navbarOpacityDiv">
        <nav class="navbar navbar-default navbar-fixed-top opaque-navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand navbar-link" href="goHome.do"> <strong>BingeSync</strong><span id="hiUserSpan"> &gt; Hi, ${user.username}.</span></a>
                    <button class="navbar-toggle collapsed toggle-animated" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                </div>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li role="presentation"><a href="trackShow.do">AddShows.</a></li>
                       <li role="presentation"><a href="viewParties.do">ViewGroups.</a></li>   
                        <li role="presentation"><a href="manageParties.do">ManageGroups. </a></li>
  
                        <li role="presentation"><a class="text-muted" href="logOut.do" id="logOutButton">LogOut. </a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-left"></ul>
                    <ul class="nav navbar-nav navbar-left" data-bs-hover-animate="flash"></ul>
                </div>
            </div>
        </nav>
    </div>
    <div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 col-md-offset-0" id="showColumn">
                    <div id="allShowsDiv">
                    <c:forEach items="${user.tvShows}" var="tvShow">
                    
	                        <div id="showDiv">
	                        	<form action="untrackShows.do">
	                            <h2 class="text-left" class="showTitleHeader">${tvShow.title}
	                            <button class="btn btn-default" type="submit">Unfollow Show</button> </h2>
	                            <input type="hidden" name="userId" value="${user.id}">
	                            <input type="hidden" name="tvShowIds" value="${tvShow.id}">
	                            </form>
	                            <img src="${tvShow.imgUrl}" class="showImage" style="height:150px;" />
	                            
	                            <c:forEach items="${tvShow.seasons}" var="season">
			                            <div id="seasonDiv">
			                            	 <form action="watchEpisode.do" method="post">
			                                <h3 class="text-left" id="seasonTitle">${season.title}
			                                <button class="btn btn-default" type="submit">Update </button></h3>
											<input type="hidden" name="seasonId" value="${season.id}">
											<input type="hidden" name="userId" value="${user.id}"> 
												<div class="checkbox-wrapper">
													<div class="checkbox">
			 											<div id="episodesDiv">
				                            	 			<c:forEach items="${season.episodes}" var="episode">
					 											<span class="episodeChkBox profileSplashEpisodeCheckboxes">
					 																	
					 											<c:choose>
																	<c:when test="${user.userEpisodes[episode.id].watched=='1'}">
																	<label class="checkbox-inlineGreen">
					 													<input type='checkbox' class="checkbox-inlineGreen" name='watchedEpisodes' value='${episode.id}' checked>
				 														${episode.title}
																	</c:when>
																	<c:otherwise>
																	<label>
																		<input type='checkbox' name='watchedEpisodes' value='${episode.id}'>
																		${episode.title}
		 			 												</c:otherwise>
																</c:choose>
															</label>
				 												</span>
															</c:forEach>
		 												</div>
													</div>
												</div>
											</form>
			                            </div>
	                            </c:forEach>
	                        </div>
                        
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-basic">
        <div id="footerOpacityDiv">
            <footer>
                <ul class="list-inline">
                    <li><a href="goHome.do">Home</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
                <p class="copyright">BingeSync © 2017</p>
            </footer>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-animation.js"></script>
    <script src="assets/js/Transparent-Navigation-with-animation-on-scroll.js"></script>
    <script src="assets/js/Transparent-Navigation-with-animation-on-scroll1.js"></script>
</body>

</html>