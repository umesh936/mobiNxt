<%@ page import="com.mettl.mettlUi.utils.PageUtils"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="m" uri="mettlLibrary" %>
<%@ taglib prefix="ms" uri="mettlSecurityLibrary" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<c:set value="${ms:corporateUser(pageContext.request)}" var="corporateUser"/>
<c:set value="${ms:permissions(corporateUser) }" var="permissions"/>
<c:set var="contextPath" value="${pageContext.request.contextPath == '' ? '' : '/'+pageContext.request.contextPath}" />
<c:set var="LogoPath" value="${ms:logo(corporateUser.associatedClient.logoPath)}" />

<!DOCTYPE html>

<html>
<head>
    <title><tiles:insertAttribute name="title"  /></title>
    <link href="${m:image("favicon.ico")}" rel="shortcut icon" />
    <meta property="fb:page_id" content="171382302924212" />
    <meta property="og:title" content="<tiles:insertAttribute name="title"  />"/>
    <meta itemprop="name" content="Mettl" />
    <meta property="og:url" content="http://mettl.com${requestScope['javax.servlet.forward.request_uri']}"/>
    <meta property="og:image" content="${m:image("mettl_beta.png")}"/>
    <meta property="og:site_name" content="mettl.com"/>
    <meta name="description" content="<tiles:insertAttribute name="metaDescription"  />" />
    <meta itemprop="image" content="${m:image("mettl_beta.png")}" />
    <meta content='website' property='og:type'>

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400italic|Open+Sans:300,400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" media="all" href="${m:css('shared/mettl.css')}" />
    <script type="text/javascript" src="${m:js('basic.min.js')}"></script>

    <tiles:insertAttribute name="head"  />

    <script type="text/javascript" >

        var isAuthenticated  = ${corporateUser != null ? true : false };

        var conf = {
            staticResourceUrl : "${m:staticUrl()}",
            version: "${m:version()}"
        };


        <!-- start Mixpanel -->
        (function(e,b){if(!b.__SV){var a,f,i,g;window.mixpanel=b;a=e.createElement("script");a.type="text/javascript";a.async=!0;a.src=("https:"===e.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';f=e.getElementsByTagName("script")[0];f.parentNode.insertBefore(a,f);b._i=[];b.init=function(a,e,d){function f(b,h){var a=h.split(".");2==a.length&&(b=b[a[0]],h=a[1]);b[h]=function(){b.push([h].concat(Array.prototype.slice.call(arguments,0)))}}var c=b;"undefined"!==
                typeof d?c=b[d]=[]:d="mixpanel";c.people=c.people||[];c.toString=function(b){var a="mixpanel";"mixpanel"!==d&&(a+="."+d);b||(a+=" (stub)");return a};c.people.toString=function(){return c.toString(1)+".people (stub)"};i="disable track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.track_charge people.clear_charges people.delete_user".split(" ");for(g=0;g<i.length;g++)f(c,i[g]);
            b._i.push([a,e,d])};b.__SV=1.2}})(document,window.mixpanel||[]);

        if(conf.staticResourceUrl == "//mettl.com"){
            mixpanel.init("30bb0b1c9c1e3831306525c057b69d56");
        }
        else{
            mixpanel.init("6245e780cc3e37d4365423f25f09ac7b");
        }


        var pageURL = window.location.pathname;

        // Register Candidate On all Static pages
        mixpanel.register_once({'first_landing_page' : pageURL, 'first_seen_on' : new Date()});

        // Track Some Static Pages
        var pageList = ["signup","pricing","careers","about","team","investors","clients","testimonials","media","feature","saas","terms-of-services","contact-us"];
        for(var i = 0; i < pageList.length; i++){
            if(pageURL.contains(pageList[i]) || pageURL == "/"){
                if(isAuthenticated){
                    mixpanel.track('Page View - Prelogin', {'URL': pageURL, 'user-state': 'logged-in'})
                }
                else{
                    mixpanel.track('Page View - Prelogin', {'URL': pageURL, 'user-state': 'not-logged-in'});
                }
                break;
            }
        }

        // Google Analytics
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-17988806-4']);
        _gaq.push(['_setDomainName', 'none']);
        _gaq.push(['_setSiteSpeedSampleRate', 100]);
        _gaq.push(['_setAllowLinker', true]);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>

</head>
<body>
    <div id="notification-area"><div class="wrapper"><div id="notify">Loading...</div></div></div>

    <tiles:insertAttribute name="mettlHeader"  />

    <div class="clearer"></div>

    <tiles:insertAttribute name="body"  />

    <div class="clearer"></div>

    <tiles:insertAttribute name="mettlFooter"  />

    <script type="text/javascript">

        $.blockUI.defaults.css = {};

        /* for cross-browser support */
        if(!("placeholder" in document.createElement("input")))
            $('.ie-elem').show();


        $("#head")
                .undelegate('.dropdown','hover').delegate('.dropdown','hover', function(e){
                    $(this).toggleClass("hover");
                    e.stopPropagation();
                });

        $("._tooltip").tooltip();

    </script>
	<%--<script src="//cdn.optimizely.com/js/213428999.js"></script>--%>
    <!-- begin olark code -->
    <script data-cfasync="false" type='text/javascript'>
        try{
            /*<![CDATA[*/window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){
                f[z]=function(){
                    (a.s=a.s||[]).push(arguments)};var a=f[z]._={
                },q=c.methods.length;while(q--){(function(n){f[z][n]=function(){
                    f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={
                    0:+new Date};a.P=function(u){
                    a.p[u]=new Date-a.p[0]};function s(){
                    a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){
                    hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){
                    return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){
                    b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{
                    b.contentWindow[g].open()}catch(w){
                    c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{
                    var t=b.contentWindow[g];t.write(p());t.close()}catch(x){
                    b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({
                loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
            /* custom configuration goes here (www.olark.com/documentation) */
            olark.identify('5286-649-10-7990');/*]]>*/
        }
        catch(e){
            console.log(e.message);
        }
    </script>
    <noscript><a href="https://www.olark.com/site/5286-649-10-7990/contact" title="Contact us" target="_blank">Questions? Feedback?</a> powered by <a href="http://www.olark.com?welcome" title="Olark live chat software">Olark live chat software</a></noscript>
    <!-- end olark code -->
	<!-- Google Code for Remarketing tag -->
	<!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->
	<script type="text/javascript">
	/* <![CDATA[ */
	var google_conversion_id = 994083462;
	var google_conversion_label = "pIDUCILW7gQQhoWC2gM";
	var google_custom_params = window.google_tag_params;
	var google_remarketing_only = true;
	/* ]]> */
	</script>
	<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>
	<noscript>
	<div style="display:inline;">
	    <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/994083462/?value=0&amp;label=pIDUCILW7gQQhoWC2gM&amp;guid=ON&amp;script=0"/>
	</div>
	</noscript>

</body>
</html>