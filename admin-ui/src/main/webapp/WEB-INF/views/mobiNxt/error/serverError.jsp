<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%
    String errorMessage = "";

    if(request.getAttribute("error") != null)
        errorMessage = (String)request.getAttribute("error");
    else if(request.getParameter("error") != null)
        errorMessage = (String)request.getParameter("error");


    String errorDetails = "";
    if (request.getAttribute ("errorDetails") != null)
        errorDetails = (String) request.getAttribute("errorDetails");
%>

<div id="content">
    <div class="wrapper">
        <h1 class="page-info">Error has occurred while processing your request.</h1>
        <div id="pane">
            <div class="pane-wrapper">
                <div class="image-frame floatleft">
                    <img src="" class="error-image" width="150px" height="130px" alt="error" />
                </div>
                <div class="text-frame error floatleft">
                    <h3>Reason for this error:</h3>
                    <div> <%= errorMessage %></div>
                </div>
                <div class="clearer"></div>
                <div id="errorDetails">
                    <%=errorDetails %>
                </div>
                <div class="clearer"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

</script>
