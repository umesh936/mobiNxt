<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="m" uri="mettlLibrary"%>

<div id="content">
    <div class="wrapper">
        <div class="head">
            <a href="/"><img src="${m:image("mettl-logo.png")}" alt="Mettl-logo" /></a>
        </div>
        <div id="form">
            <div class="reset">
                <c:choose>
                 <c:when test="${!status}">
                    <h2>${resetMessage}</h2>
 					<div>You can re generate the reset password link by clicking on</div><br/>
 					<div class="last-div"><a href="/corporate/forgot-password">forgot password</a></div>
                 </c:when>
                 <c:otherwise>
                 	<h2>Reset Password</h2>
                 	 <form:form id="formReset" action="/corporate/updatePassword" name="reset" spellcheck="false" method="post" >
	                    <div class="input-box first">
							<input type="hidden" value="${pattern }" name="pattern" />                    	
	                        <input type="password" placeholder="New Password" value="" name="password" />
	                        <span class="placeholder">New Password</span>
	                       	 <c:if test="${!m:isEmpty(resetMessage)}">
                            	<label class="error">${resetMessage}</label>
                 			</c:if>
	                    </div>
	                    <div class="input-box last">
	                        <button type="submit" class="button medium green">Reset My Password</button>
	                    </div>
	                    <div class="text-left">
	                        <a href="/forgot-password" class="forgot-password">Forgot Password?</a>
	                    </div>
               		 </form:form>
                 </c:otherwise>
               	</c:choose>
            </div>
        </div>
    </div>
    <br/>
</div>

<script type="text/template" id="resetPassword-error-template" >
    <div class="message">
        <h3>\${resetMessage}</h3><br/>
        <div>You can again generate the forgot password link by clicking on</div>
        <div class="last-div"><a href="/forgotPassword"></a></div>
    </div>
</script>

<script type="text/javascript" src="${m:js('jquery.validate.min.js')}"></script>
<script type="text/javascript" src="${m:js('prelogin/validate.js')}"></script>

