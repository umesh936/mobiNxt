<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="content">
    <div class="wrapper">
        <div class="head">
            <c:choose>
                <c:when test="${empty clientLogo}">
                    <a href="${m:staticPagesUrl()}"><img src="${m:image("mettl-logo.png")}" alt="Mettl-logo" /></a>
                </c:when>
                <c:otherwise>
                    <a href="${m:staticPagesUrl()}"><img id="client-logo" height="60px" src="${m:staticPagesUrl()}/logo/${clientLogo}" alt="Mettl-client-logo" /></a>
                </c:otherwise>
            </c:choose>
        </div>

        <c:choose>
            <c:when test="${(!m:isEmpty(errorCode) && errorCode eq 'CUE003')or (!m:isEmpty(forgotErrorCode) && forgotErrorCode eq 'CUE003')}">
                <div class="message">
                    <h2>Account not verified !</h2><br/>
                    <div>Email verification for ${email} is still pending.</div>
                    <div>Please verify the same to enable ${source}.</div>
                    <div><a href="/corporate/resendactivation?user=${email}&source=${source}">Resend email verification link</a></div>
                </div>
            </c:when>
            <c:when test="${!m:isEmpty(resendActivation) && resendActivation}">
                <div class="message">
                    <h2>Email verification link sent</h2><br/>
                    <div>We have resent the email verification link to ${email}.</div>
                    <div>Please check and verify this email user.</div>
                </div>
            </c:when>
            <c:when test="${!m:isEmpty(resendActivation) && !resendActivation}">
                <div class="message">
                    <h2>${errorCode }</h2>
                </div>
            </c:when>
            <c:when test="${!m:isEmpty(activateError) && activateError eq 'InvalidLink'}">
                <div class="message">
                    <h2>Invalid Link !</h2><br/>
                </div>
            </c:when>
            <c:when test="${!m:isEmpty(activateError) && activateError eq 'MultipleVerificationLinks'}">
                <div class="message">
                    <h2>Incorrect Verification Link</h2><br/>
                    <p>If you have received multiple verification links. Please <u>click on the</u></p>
                    <p><u>last link sent to you</u>. Or, <a href="/corporate/resendactivation?user=${email}&source=Login">get a new verification link.</a></p>
                </div>
            </c:when>
            <c:otherwise>
                <div id="form">
                    <div id="login-form" style='display: ${not empty forgotEmail ? "none": "block"}; overflow: visible !important;'>
                        <c:choose>
                            <c:when test="${!m:isEmpty(activateError) && activateError eq 'AccountAlreadyVerified'}">
                                <h2>Account already verified, Login</h2>
                            </c:when>
                            <c:when test="${!m:isEmpty(passwordResetSuccessful) && passwordResetSuccessful}">
                                <h2>Password Reset Successful, Login</h2>
                            </c:when>
                            <c:when test="${!m:isEmpty(activateError) && signupSuccess}">
                                <h2>Email verified, Please Login</h2>
                            </c:when>
                            <c:otherwise>
                                <h2>Login</h2>
                            </c:otherwise>
                        </c:choose>
                        <form id="formLogin" action="/corporate/login" method="POST" name="login" spellcheck="false"  >
                            <input type="hidden" name="returnUrl" value='${param.returnUrl}' />
                            <div class="input-box first">
                                <input type="text" placeholder="Email" value="${email}" name="userName" />
                                <span class="placeholder"><c:out value="${m:isEmpty(email) ? 'Email' : ''}"></c:out></span>
                                <c:if test="${!m:isEmpty(errorCode) && errorCode eq 'CUE001'}">
                                    <label class="error">Not a registered user. <a href="/corporate/signup">Signup here</a></label>
                                </c:if>
                            </div>
                            <div class="input-box">
                                <input placeholder="Password" type="password" value="" name="password" />
                                <span class="placeholder">Password</span>
                                <c:if test="${!m:isEmpty(errorCode) && errorCode eq 'CUE002'}">
                                    <label class="error">Incorrect Password</label>
                                </c:if>
                            </div>
                            <div class="input-box last">
                                <button type="submit" class="button medium green">Login</button>
                            </div>
                            <div class="text-left">
                                <a id="forgot-password">Forgot Password?</a>
                            </div>
                        </form>
                    </div>
                    <div id="forgot-form" style='display: ${empty forgotEmail ? "none": "block"}; overflow: visible !important;'>
                        <h2>Forgot Password!</h2>
                        <form id="formForgot" method="POST" action="/corporate/forgot-password" name="forgot" spellcheck="false" autocomplete="off">
                            <div class="input-box first">
                                <input type="text" placeholder="Provide your email address" value="${forgotEmail}" name="userName" />
                                <span class="placeholder"><c:out value="${m:isEmpty(emailid) ? 'Provide your email address' : ''}"></c:out></span>
                                <c:choose>
                                    <c:when test="${empty showForgot && not empty forgotMessage}">
                                        <label class="error">${forgotMessage}</label>
                                    </c:when>
                                </c:choose>
                            </div>
                            <div class="input-box last">
                                <button type="submit" class="button medium green">Send password reset link</button>
                            </div>
                            <div class="text-left">
                                <a id="to-login">Back to login</a>
                            </div>
                        </form>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
   <div class="copyright">
        <span class="floatright">&copy; 2014 Mettl.com | <a href="${m:staticPagesUrl()}/privacy-policy">Privacy Policy</a></span>
    </div>
    <br/>
</div>

<script type="text/template" id="forgot-password-template" >
    <div class="message">
        <h2>Password reset link sent</h2><br/>
        <div>We have sent the password reset link to <strong>\${email}</strong>.</div>
        <div>Please continue with this process through the email sent to you.</div>
    </div>
</script>

<script type="text/javascript" src="${m:js('jquery.validate.min.js')}"></script>
<script type="text/javascript" src="${m:js('prelogin/validate.js')}"></script>
<script type="text/javascript" src="${m:js('landing/authenticate.js')}"></script>

<input type="hidden" id="errorCode" value="${errorCode}" />
<input type="hidden" id="forgotErrorCode" value="${forgotErrorCode}" />
<input type="hidden" id="resendActivation" value="${resendActivation}" />
<input type="hidden" id="source" value="${source}" />
<input type="hidden" id="clientLogoPath" value="${clientLogo}" />
<input type="hidden" id="email" value="${email}" />
<input type="hidden" id="signUpSuccess" value="${signupSuccess}" />
<input type="hidden" id="ActivateError" value="${activateError}" />
<input type="hidden" id="showForgot" value="${showForgot}" />
<input type="hidden" id="forgotMessage" value="${forgotMessage}" />
<input type="hidden" id="forgotEmail" value="${forgotEmail}" />
