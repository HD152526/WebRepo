<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "org.dimigo.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>myblog</title>
<link rel="stylesheet" href="/WebClass/css/myblog.css">
  <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<script type="text/javascript" src="/WebClass/js/myblog.js"></script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="myblog.jsp">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item" onmouseover = "menu_over(this);" onmouseout = "menu_out(this);">
        <a class="nav-link" href="myFavorite.html">My Favorite<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item" onmouseover = "menu_over(this);" onmouseout = "menu_out(this);">
        <a class="nav-link" href="Dream.html">Dream</a>
      </li>
      <li class="nav-item" onmouseover = "menu_over(this);" onmouseout = "menu_out(this);">
        <a class="nav-link" href="Music.html">Music</a>
      </li>
    </ul>
  	
    <%-- 세션에 사용자 정보가 없는 경우 --%>
    <%
		UserVO user = (UserVO) session.getAttribute("user");
		if(user == null){
    %>
    	<a class="text-bold text-white" style="text-decoration: none" href="/WebClass/login">Sign in</a> 
    	<span class="text-bold text-white">&nbsp; or &nbsp;</span>
    	<a class="text-bold text-white" style="text-decoration: none" href="/WebClass/signup">Sign up</a>
    	<% } else { %>
    <%-- 세션에 사용자 정보가 있는 경우 --%>
	    <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
	    <li class="nav-item dropdown">
	      <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    	<%= user.getName() + "님" %>
	      </a>
	      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
	      	<form action = "/WebClass/bloglogout" method="post">    	
	      	<button type="submit" class="dropdown-item">Sign out</button>
	      	</form>
	       	<div class="dropdown-divider"></div>
	        <button type="button" class="dropdown-item">Action1</button>
	        <button type="button" class="dropdown-item">Action2</button>
	      </div>
	    </li>
	    </ul>
	    <% } %>
  </div>
</nav>

<div class="jumbotron">
  <h1 class="display-3">Welcome to MyBlog!</h1>
  <p class="lead"> Korea Digital Media High School 2-5 이소민 </p>
  <hr class="my-4">
  <p>Please register!</p>
  <p class="lead">
    <a class="btn btn-secondary btn-lg" onclick = "register();" role="button" >Register</a>
  </p>
</div>
<div class="modal" id = "myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">로그인 결과</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div class="modal" id ="registerModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">회원가입</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">   
      <form id = "signUpForm">  
        <input type="radio" name="grade" value="1" required>1학년
        <input type="radio" name="grade" value="2" required>2학년
        <input type="radio" name="grade" value="3" required>3학년 &nbsp;
        
        <select required>
        <option value="">-반-</option>
        <option value="1">1반</option>
        <option value="2">2반</option>
        <option value="3">3반</option>
        <option value="4">4반</option>
        <option value="5">5반</option>
        <option value="6">6반</option>
        </select> 
        <input id="number" class="form-control mr-sm-2" type="text" placeholder="번호" aria-label="번호" required> &nbsp;
        <input id="name" class="form-control mr-sm-2" type="text" placeholder="이름" aria-label="이름" required>
      <div class="modal-footer" > 
        <button type="submit" class="btn btn-secondary">Submit</button>
      </div>
       </form>      
      </div>
    </div>
  </div>
</div>
<div class="modal" id="myModal2">
    	<div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">회원가입 결과</h4>
            </div><div class="container"></div>
            <div class="modal-body">
              <p></p>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
            </div>
          </div>
        </div>
    </div>
</body>
</html>