//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~








//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


vec3 rgb2hsl( in vec3 c ){
    float h = 0.0;
    float s = 0.0;
    float l = 0.0;
    float r = c.r;
    float g = c.g;
    float b = c.b;
    float cMin = min( r, min( g, b ) );
    float cMax = max( r, max( g, b ) );
    
    l = ( cMax + cMin ) / 2.0;
    if ( cMax > cMin ) 
    {
        float cDelta = cMax - cMin;
                
        s = l < .0 ? cDelta / ( cMax + cMin ) : cDelta / ( 2.0 - ( cMax + cMin ) );
                
        if ( r == cMax ) 
        {
            h = ( g - b ) / cDelta;
        }
         
        else if ( g == cMax ) 
        {
            h = 2.0 + ( b - r ) / cDelta;
        } 
            else 
        {
            h = 4.0 + ( r - g ) / cDelta;
        }
        
        if ( h < 0.0) 
        {
            h += 6.0;
        }
        
        h = h / 6.0;
    }
    return vec3( h, s, l );
}


vec3 hsl2rgb( in vec3 c )
{
    vec3 rgb = clamp( abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),6.0)-3.0)-1.0, 0.0, 1.0 );

    return c.z + c.y * (rgb-0.5)*(1.0-abs(2.0*c.z-1.0));
}

    /////

void main()
{
    vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 colsum = vec3(col.r , col.g , col.b );
    vec3 hsl;
    hsl = rgb2hsl(colsum);

    /*
    BLACK ( 209, 27, 21)
    
    BLUE ( 199, 42, 41)
    
    GREEN ( 132, 48, 67)
    
    WHITE ( 68, 60, 91)
    
    RED ( 332, 100, 68)
    */
    
    if (hsl.x > ( 310.0 / 360.0) ) {
        hsl.x = ( 332.0 / 360.0 );
        hsl.y = 1.0;
        hsl.z = 0.68;
        } else
        
    if (hsl.x > ( 50.0 / 360.0) && hsl.x < ( 70.0 / 360.0) && hsl.z <= 0.30 ) {
        hsl.x = ( 199.0 / 360.0 );
        hsl.y = 0.42;
        hsl.z = 0.41;
        } else
    
    if (hsl.z <= 0.30){
        hsl.x = ( 209.0 / 360.0 );
        hsl.y = 0.27;
        hsl.z = 0.21;
        } else
        
    if (hsl.z <= 0.66){
        hsl.x = ( 199.0 / 360.0 );
        hsl.y = 0.42;
        hsl.z = 0.41;
        } else
        
    if (hsl.z <= 0.85){
        hsl.x = ( 132.0 / 360.0 );
        hsl.y = 0.48;
        hsl.z = 0.67;
        } else
        
    if (hsl.z <= 1.0){
        hsl.x = ( 68.0 / 360.0 );
        hsl.y = 0.60;
        hsl.z = 0.91;
        }

    
    colsum = hsl2rgb(hsl);
    col.r = colsum.r;
    col.g = colsum.g;
    col.b = colsum.b;
    
    gl_FragColor = col;
}
