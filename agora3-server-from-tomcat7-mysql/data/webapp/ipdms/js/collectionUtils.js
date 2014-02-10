/**
 * 
 *
 */

/////////////////////////////////////////
//	check if obj is empty				//
//	Used to check if an object similar  //
//	to an map object is empty or not.	//
//////////////////////////////////////////
function collectionIsEmpty(obj) {
	
    for(var prop in obj) {
        if(obj.hasOwnProperty(prop))
            return false;
    }

    return true;
}

