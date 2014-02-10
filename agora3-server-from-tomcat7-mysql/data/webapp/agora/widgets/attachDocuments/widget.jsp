<script>
    $(document).ready(function() {
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/agora/prepare.do',
            data: {taskId: "${taskId}"},
            dataType: 'html',
            error: function(transport) {
                console.log('Server side Error : ' + transport.status);
            },
            success: function(data) {
                $("#attachDocumentsDiv").html(data);
            }
        });
    });
</script>


<div id="attachDocumentsDiv"></div>