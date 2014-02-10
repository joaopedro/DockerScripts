<script>

    $(document).ready(function() {

        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/agora/prepareActivity.do',
            data: {taskId: '${taskId}'},
            dataType: 'html',
            beforeSend: function() {
                $("body").mask(fmtResources.loadingMsg);
            },
            complete: function() {
                $("body").unmask();
            },
            error: function(transport) {
                console.log('Server side Error : ' + transport.status);
            },
            success: function(data) {
                $("#respondActivityDiv").html(data);
            }
        });

    });

</script>

<div id="respondActivityDiv"></div>

