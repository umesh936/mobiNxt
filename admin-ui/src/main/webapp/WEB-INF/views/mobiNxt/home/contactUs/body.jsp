<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div id="content">
        <div class="wrapper">
            <c:choose>
                <c:when test="${successfulQuery}">
                    <script type="text/javascript">
                        $(document).ready(function(){
                            try{
                                _gaq.push(['_trackEvent', 'Site-Interaction', 'Contact-Us-Page', '<c:out value="${name}"></c:out>_<c:out value="${email}"></c:out>']);
                            }catch(e){

                            }
                         });
                    </script>
                    <h1 id="successMsg">We will respond to your query soon.</h1>
                </c:when>
                <c:otherwise>
                        <h1 class="page-info">Contact MobiNxt</h1>
                        <div id="pane">
                            <div class="pane-wrapper">
                                <div class="full-width divider"></div>
                                <div class="image-frame">
                                    <div class="contact-text">
                                        <div><strong>Registered Name : </strong><span> Mobi Next -Gen  Pvt Ltd</span></div><br>
                                        <div class="clearer"></div>

                                    </div>
                                    <div class="clearer"></div>
                                    <div class="block contact-block floatleft">
                                        <div><strong>Email : </strong><a href="mailto:contact@mobiNxt.com">contact@mobiNxt.com</a></div>
                                        <%--<div><strong>Phone : </strong><span>+91 - 124 - 3220914</span> <span>(Office)</span> </div>--%>
                                        <%--<div><strong>&nbsp;</strong><span>+91 - 92666 - 38808 </span> <span>(Sales)</span> </div>--%>
                                        <%--<div><strong>&nbsp;</strong><span>+91 - 82878 - 03040 </span> <span>(Support)</span> </div>--%>
                                    </div>
                                </div>
                                <div class="auth-box">
                                    <c:choose>
                                        <c:when test="${m:isEmpty(requestScope.message) }">
                                            <div class="page-message error">
                                                <div class="icon"></div>
                                                <div class="text">
                                                    <strong>Error</strong><span id="message">${message}</span>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="page-message error">
                                                <div class="icon"></div>
                                                <div class="text">
                                                    <strong>Error</strong><span id="message">${message}</span>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                    <div class="clearer"></div>
                                    <form action="/corporate/sendFeedback" method="post" id="contactUsForm" class="validation-mess _un" >
                                        <div class="input-block">
                                            <input placeholder="Your name" data-val="true" id="name" name="n" type="text" autocomplete="off" />
                                            <span class="placeholder ie-elem">Your name</span>
                                        </div>
                                        <div class="input-block">
                                            <input placeholder="Your email" id="email" name="e" type="text" autocomplete="off" />
                                            <span class="placeholder ie-elem">Your email</span>
                                        </div>
                                        <div class="input-block">
                                            <textarea placeholder="Feedback/Query" cols="20" rows="" id="feedback" name="f" rows="2" autocomplete="off" ></textarea>
                                            <span class="placeholder ie-elem">Feedback/Query</span>
                                        </div>
                                        <div class="input-block pane-bottom">
                                            <a id="takeTest" class="button green floatright _submit"> Contact Us  </a>
                                        </div>
                                    </form>
                                </div>
                                <div class="clearer"></div>
                            </div>
                                <%--<div class="pane-bottom">
                                    <div class="floatright bottom-right">
                                        <a id="takeTest" class="button green floatright _submit"> Contact Us  </a>
                                    </div>
                                    <div class="clearer"></div>
                                </div>--%>
                        </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <script type="text/javascript">
        \$('._submit').click(function () {
            \$("#message").html('');
            var name = \$.trim(document.getElementById('name').value);
            var email = \$.trim(document.getElementById('email').value);
            var feedback = \$.trim(document.getElementById('feedback').value);

            if (!name) {
            \$("#message").html('Please provide your name').parents('.page-message').slideDown('fast');
                return;
            }

            if (!Mettl.Util.IsValidEmail(email)) {
            \$("#message").html('Please provide valid email').parents('.page-message').slideDown('fast');
                return;
            }

            if (!feedback) {
            \$("#message").html('Please enter query/feedback').parents('.page-message').slideDown('fast');
                return;
            }

            \$("#contactUsForm").submit();
        });
    </script>

