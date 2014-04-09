<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="m" uri="mettlLibrary"%>

<div id="content">
    <div class="wrapper">
        <div class="head">
            <a href="${m:staticPagesUrl()}"><img src="${m:image("mettl-logo.png")}" alt="Mettl-logo" /></a>
        </div>
        <div id="form">
            <div class="signup">
                <h1>Free Signup</h1>
                <form:form action="" id="formSignup" name="signup" spellcheck="false" method="post" autocomplete="off" >
                    <div class="input-box first">
                        <input class="_signup-input" placeholder="Email" type="text" id="signup-email" name="userName" >
                        <span class="placeholder">Email</span>
                    </div>
                    <div class="input-box">
                        <input class="_signup-input" placeholder="Password" type="password" id="signup-password" name="password" >
                        <span class="placeholder">Password</span>
                    </div>
                    <div class="input-box">
                        <input class="_signup-input" placeholder="Your Name" type="text" id="signup-firstName" name="firstName" >
                        <span class="placeholder">Your Name</span>
                    </div>
                    <div class="input-box">
                        <input class="_signup-input" placeholder="Phone Number" id="signup-phoneNumber" type="text" name="contactDetails">
                        <span class="placeholder">Phone Number</span>
                    </div>
                    <div class="input-box">
                        <input class="_signup-input" placeholder="Company Name" id="signup-organisation" type="text" name="organisation">
                        <span class="placeholder">Company Name</span>
                    </div>
                    <div class="input-box">
                        <select name="purpose" class="_signup-input" id="signup-purpose">
                            <option value="">I want to...</option>
                            <option value="1">Conduct Online Exams, Tests</option>
                            <option value="2">Conduct Online Recruitment</option>
                            <option value="3">Conduct Online Contests</option>
                            <option value="4">Assess, Train Employees</option>
                            <%--<option value="5">Monster College</option>--%>
                            <option value="6">Prepare for Tests, Interviews</option>
                        </select>
                    </div>
                    <div class="input-box last">
                        <button type="submit" id="signup" class="button medium green">Create Account</button>
                    </div>
                </form:form>
                <div id="footer">
                    By clicking the 'Create Account' button, you will be agreeing to our <br/> <a target="_blank" href="/privacy-policy">Privacy Policy</a> and <a target="_blank" href="/terms-of-services">Terms of Service</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/template" id="signup-success-template" >
    <div class="message">
        <h2>Check your email for verification link</h2><br/>
        <div>We have sent you an email verification link to \${userName}.</div>
        <div class="last-div">Please check and verify to enable login.</div>
    </div>
</script>

<script type="text/template" id="account-exist-template" >
    <div class="message">
        <h2>Account already exists!</h2><br/>
        <div>\${userName} is already a registered user.</div>
        <div class="last-div">Please <a href="/login">login here</a></div>
    </div>
</script>

<script type="text/template" id="account-unVerified-template" >
    <div class="message">
        <h2>Account already exists</h2><br/>
        <div>\${userName} is already a registered email address.</div>
        <div>but verification is still pending. <a href="/corporate/resendactivation?user=\${userName}&source=Signup">Resend email verification link</a>.</div>
    </div>
</script>

<script type="text/template" id="prevent-signup-template" >
    <div class="message">
        <h2>Sorry!</h2><br/>
        <div>Your account can not be created.</div>
        <div>Mettl is not for Self Assessment or Exam Preparation purposes</div>
    </div>
</script>

<script type="text/javascript" src="${m:js('jquery.validate.min.js')}"></script>
<script type="text/javascript" src="${m:js('prelogin/validate.js')}"></script>
