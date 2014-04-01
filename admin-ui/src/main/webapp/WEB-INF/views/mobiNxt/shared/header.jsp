<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page session="false"%>

<c:set value="pageContext.request" var="corporateUser"/>
<c:set var="contextPath" value="${pageContext.request.contextPath == '' ? '' : '/' + pageContext.request.contextPath}" />
<c:set var="LogoPath" value="" />

<c:choose>
    <c:when test="${corporateUser != null }">
        <div id="header">
            <div class="wrapper">
                <a class="identity" href="${ms:canSeeAssessments(permissions)? '/corporate/assessmentsHome' : ''}">
                    <c:choose>
                        <c:when test="${empty LogoPath}">
                            <img src="${m:image('post-login-mettl-brand-logo.png')}" alt="mettl-logo" />
                        </c:when>
                        <c:otherwise>
                            <img src="${LogoPath}" alt="mettl-client" />
                        </c:otherwise>
                    </c:choose>
                </a>
                <div id="rightPart">
                    <c:if test="${ms:isProfessionalAccount(pageContext.request)}">
                        <div class="balance">
                            <c:choose>
                                <c:when test="${ms:isAssociatedClient(pageContext.request)}">
                                    <a href="/corporate/billing/activity"><span title='Click here to add amount' id="account-balance"></span></a>
                                </c:when>
                                <c:otherwise>
                                    <span id="account-balance"></span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>
                    <div id="user-menus">
                        <a class="_user-name user-name"><span>${corporateUser.firstName}</span><span class="drop-down-icon"></span></a>
                        <ul>
                            <li><a target="_blank" href="http://support.mettl.com/" class="">Help</a></li>
                            <li><a href="/corporate/my-account/profile">My Account</a></li>
                            <c:if test="${ms:isProfessionalAccount(pageContext.request) && ms:isAssociatedClient(pageContext.request)}">
                                <li><a href="/corporate/billing/activity">Billing</a></li>
                            </c:if>
                            <li><a href="/corporate/my-account/settings">Global Settings</a></li>
                            <c:if test="${ms:isAssociatedClient(pageContext.request) && !ms:isTestPrepAccount(pageContext.request)}">
                                <li><a href="/corporate/my-account/activity">Account Activity</a></li>
                            </c:if>
                            <li><a href="/privacy-policy">Privacy Policy</a></li>
                            <li><a href="/corporate/SignOut">Log Out</a></li>
                        </ul>
                    </div>
                    <div class="clearer"></div>
                </div>
                <div class="clearer"></div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div id="head">
            <div class="wrapper">
                <div class="menu">
                    <ul class="contentmenu">
                        <span class="dummynotation"></span>

                        <li>
                            <a class="_feature" href="/feature/online-test-creation">Features</a>
                        </li>
                        <li>
                            <a class="_pricing"  href="/pricing">Pricing</a>
                        </li>
                                        
                      </ul>
                    <ul class ="corporate usermenu">
                        <span class="notation">For Companies</span>
                        <li class="first"><a class="first dark button" href="/corporate/login">Login</a></li>
                        <li class="last"><a class="last button green" href="/corporate/signup">Free Trial</a></li>
                    </ul>
                </div>
                <div class="clearer"></div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
