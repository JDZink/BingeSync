<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BingeSync > Manage Groups</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Monda:400,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/manageParties.css">
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
        <div class="container" id="groupsDiv">
            <div class="row" id="groupsRow">
                <div class="col-md-4 groupsColumn">
                    <div id="currentGroups" class="groupsSubDiv">
                        <h1 class="groupsHeading">Current Groups: </h1>
                        
                        <c:forEach items="${user.parties}" var="party">
	                        <form action="leaveParty.do">
	                            <div class="singleGroupDiv">
	                                <h2 class="groupNameHeading">${party.name}</h2>
	                                <div class="groupShowsDiv">
	                                	<c:forEach items="${party.tvShows}" var="tvShow">
	                                    	<h3 class="groupShowHeading">${tvShow.title}</h3>
	                                	</c:forEach>
	                                </div>
	                                <button class="btn btn-default currentGroupBtns" type="submit" name="leaveGroup">Leave </button>
	                                <button class="btn btn-default currentGroupBtns" type="submit" name="editGroup">Edit </button>
	                                <button class="btn btn-default currentGroupBtns" type="submit" name="deleteGroup">Delete </button>
	                            	<input type="hidden" name="partyId" value="${party.id}"/>
	                            </div>
	                        </form>
	                  	</c:forEach>
                   
                    </div>
                </div>
                <div class="col-md-4 groupsColumn">
                    <div id="groupsToJoinDiv" class="groupsSubDiv">
                        <h1 class="groupsHeading">Groups to Join: </h1>
                        
                        <c:forEach items="${nonUserParties}" var="party">
	                        <form action="addUsersToParty.do">
	                            <div class="singleGroupDiv">
	                                <h2 class="groupNameHeading">${party.name}</h2>
	                                <div class="groupShowsDiv">
	                                	<h3 class="groupShowHeading">Group Members:</h3>
	                                	<c:forEach items="${party.users}" var="user">
	                                    	<h3 class="groupShowHeading">${user.displayName}</h3>
	                                	</c:forEach>
	                                	<h2></h2>
	                                	<h3 class="groupShowHeading">Group Shows:</h3>
	                                	<c:forEach items="${party.tvShows}" var="tvShow">
	                                    	<h3 class="groupShowHeading">${tvShow.title}</h3>
	                      				</c:forEach>
	                                </div>
	                                <input type="hidden" name="partyId" value="${party.id}"/>
									<input type="hidden" name="userId" value="${user.id}"/>
	                                <button class="btn btn-default currentGroupBtns" type="submit" value="Join">Join </button>
	                            </div>
	                        </form>
                    	</c:forEach>
                    
                    </div>
                </div>
                <div class="col-md-4 groupsColumn">
                    <div id="groupsToJoinDiv" class="groupsSubDiv">
                        <h1 class="groupsHeading">Create a Group: </h1>
                        <form action="addParty.do">
                            <div id="createGroupDiv" class="singleGroupDiv">
                                <input class="form-control input-lg" type="text" name="partyName" placeholder="Group Name..." id="groupNameInput">
                                <select class="form-control" name="tvShows" multiple="" id="createGroupTVShowSelect">
                                    <c:forEach var="tvShow" items="${tvShows}">
                                   		<option value="${tvShow.id}">${tvShow.title}</option>
                                    </c:forEach>
                                </select>
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <button class="btn btn-default currentGroupBtns" type="submit" id="createGroupButton" value="Add">Create </button>
                            </div>
                        </form>
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