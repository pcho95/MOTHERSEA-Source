///restore_surfaces()
// Checks if any of the global surfaces are missing, and replaces them if needed

//Surface: Light Surface
if !(surface_exists( global.surfLight ) ) {
    global.surfLight = surface_create( 480, 270 );
    }
    
//Surface: Light Surface
if !(surface_exists( global.surfBypass ) ) {
    global.surfBypass = surface_create( 480, 270 );
    }
    
//Surface: Light Surface (Dark Tone)   
if !(surface_exists( global.surfLight_d ) ) {
    global.surfLight_d = surface_create( 480, 270 );
    }
    
//Surface: Light Surface (Medium Tone)   
if !(surface_exists( global.surfLight_m ) ) {
    global.surfLight_m = surface_create( 480, 270 );
    }
    
//Surface: Light Surface (Light Tone)
if !(surface_exists( global.surfLight_l ) ) {
    global.surfLight_l = surface_create( 480, 270 );
    }
    
//Surface: Light Range Surface
if !(surface_exists( global.surfRange) ) {    
    global.surfRange = surface_create( 480, 270 );
    }
    
//Surface: Light Range Surface (Cancelling Black)
if !(surface_exists( global.surfRangeBlack) ) {    
    global.surfRangeBlack = surface_create( 480, 270 );
    }

//Surface: Light Range Surface (Bright Spot)  
if !(surface_exists( global.surfRangeBright) ) {    
    global.surfRangeBright = surface_create( 480, 270 );
    }
