<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<!-- 
	JSP에서 인클루드는 2가지 방식이 있다.
	1.include 지시어를 이용한 방법.
	2.액션태그를 이용한 방법
	-->
	<%--@ include file="../Common/Link.jsp" --%>
    <jsp:include page="../Common/Link.jsp" />
    
<h4 class="mb-2">Welcome to Sneat! 👋</h4>
              <p class="mb-4">Please sign-in to your account and start the adventure</p>

              <form id="formAuthentication" class="mb-3" action="index.html" method="POST">
                <div class="mb-3">
                  <label for="email" class="user_id">Email or UserName</label>
                  <input
                    type="text"
                    class="form-control"
                    id="email"
                    name="email-username"
                    placeholder="Enter your email or username"
                    autofocus
                  />
                </div>
                <div class="mb-3 form-password-toggle">
                  <div class="d-flex justify-content-between">
                    <label class="user_pw" for="password">Password</label>
                    <a href="auth-forgot-password-basic.html">
                      <small>Forgot Password?</small>
                    </a>
                  </div>
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="password"
                      class="form-control"
                      name="password"
                      placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                      aria-describedby="password"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                </div>
                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="remember-me" />
                    <label class="form-check-label" for="remember-me"> Remember Me </label>
                  </div>
                </div>
                <div class="mb-3">
                  <button class="btn btn-primary d-grid w-100" type="submit">Sign in</button>
                </div>
              </form>

              <p class="text-center">
                <span>New on our platform?</span>
                <a href="auth-register-basic.html">
                  <span>Create an account</span>
                </a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <%
    /* session영역에 해당 속성값이 있는지 확인한다. 즉, session영역에 저장된
    속성이 없다면 로그아웃 상태이므로 로그인 폼을 웹브라우저에 출력한다. */
    if (session.getAttribute("UserId") == null) {
    %>
    <!-- 로그인 폼의 입력값을 서버로 전송하기전에 검증하기 위해 정의한 함수.
    입력값이 빈칸인지 확인하여 경고창을 띄워준다. -->
    <script>
    function validateForm(form) {
		/*
		매개변수로 전달된 DOM을 통해 하위태그인 <input>에 접근할 수 있다.
		접근시에는 name속성값을 사용하고 value는 입력된 값을 가리키게 된다.
		*/
    	if (!form.user_id.value) {
   			// 입력된 값이 없으면 경고창을 띄우고...
            alert("아이디를 입력하세요.");
   			// 입력을 위해 포커스를 이동하고...
            form.user_id.focus();
   			// submit 이벤트 리스너쪽으로 false를 반환한다.
            return false;
        }
		/* 빈칸에 대한 체크는 !(부정연산자)와 아래의 방식 2가지를 모두
		사용할 수 있다. */
        if (form.user_pw.value == "") {
            alert("패스워드를 입력하세요.");
            form.user_pw.focus();
            return false;
        }
    }
    </script>
    <%
    } else { // 로그인된 상태
    	/*
    	session영역에 속성값이 있다면 로그인에 성공한 상태이므로 회원의
    	이름과 로그아웃 버튼을 출력한다.
    	*/
    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다. <br />
        <a href = "Logout.jsp">[로그아웃]</a>
    <%
    }
    %>
</body>
</html>