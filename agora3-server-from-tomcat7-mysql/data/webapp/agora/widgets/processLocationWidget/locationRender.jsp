<style>
    #map_canvas { width:100%; min-height: 450px; height:100%}
</style>
<!--TODO fix problem where google api is loaded multiple times-->
<script
        src="http://maps.google.com/maps/api/js?sensor=false&callback=initialize">
</script>
<script>
    var map;

    //default coordinates
    var latitude=0.00;
    var longitude=0.00;
    if('${location.latitude}'!=''){

        latitude='${location.latitude}';
        longitude='${location.longitude}';
    }

    function initialize() {
        var mapOptions = {
            zoom: 8,
            center: new google.maps.LatLng(latitude,longitude),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        //create google maps object
        map = new google.maps.Map(document.getElementById('map_canvas'),
                mapOptions);

        if('${location.latitude}'!=''){
            var latLng = new google.maps.LatLng(latitude,longitude);
            var marker = new google.maps.Marker({
                position: latLng,
                map: map
            });
        }

        //resize on dialog resize
        //TODO height value not refreshing
        $(document.activeElement).on("resize",function( event, ui ) {

            google.maps.event.trigger(map, "resize");
            if('${location.latitude}'!=''){
                map.setOptions(mapOptions);
            }
        });
    }
</script>
<div id="map_canvas"></div>
 