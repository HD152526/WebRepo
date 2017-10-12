/**
 * 
 */
function menu_over(e){
 		e.setAttribute("class", "nav-item active"); 
 	}
 	function menu_out(e){
 		e.setAttribute("class", "nav-item");
 	}
 	
function register() {	  
 		  var myModal = $('#registerModal');
 		  myModal.modal();	  
 	 }
	//로그인 결과 
	$(document).ready(function () {
// 		$('#LoginForm').submit(function(event){
// 			event.preventDefault();
// 			
// 			var id = $('#id').val();
// 			var pwd = $('#pwd').val();
// 			console.log(id, pwd);
// 			
// 			$.post("/WebClass/bloglogin",
// 				{ "id" : id, "pwd" : pwd },
// 				function(data){
// 					var myModal = $('#myModal');
// 					myModal.modal();
// 					myModal.find('.modal-body').text(data.form.id + '님 로그인되었습니다.');
// 				});
// 		});
 		
 		$('#signUpForm').submit(function(event){	
 			event.preventDefault();
 			
 			var id = $('#name').val();
 			var pwd = $('#number').val();
 			console.log(id, pwd);
 			
 			$.post("http://httpbin.org/post",
 				{ "id" : id, "pwd" : pwd },
 				function(data){
 					var myModal = $('#myModal2');
 					myModal.modal();
 					myModal.find('.modal-body').text(data.form.id + '님 회원가입되었습니다.');

 					var myModal2 = $('#registerModal');
 					myModal2.modal('hide');
 					
 					
 				});
 		});
 	});
	