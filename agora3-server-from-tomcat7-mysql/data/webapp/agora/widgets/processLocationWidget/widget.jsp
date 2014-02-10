<script>
    $(document).ready(function() {
        $.ajax({
            type: 'POST',
            url: javaVariables.contextPath + "/agora/callLocation.do",
            data: {nid: "${nid}"},
            dataType: 'html',
            error: function(transport) {
                console.log('Server side Error : ' + transport.status);
            },
            success: function(data) {
                $("#processLocationDiv").html(data);
            }
        });
    });
</script>

<div id="processLocationDiv" style="font-size: 0.625em;"></div>
