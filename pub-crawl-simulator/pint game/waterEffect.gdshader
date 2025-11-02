shader_type canvas_item;
uniform vec4 WATER_COLOR = vec4(1.0, 0.8549, 0.0, 0.65); 
void fragment() 
{ // Just draw the particle texture modulated with WATER_COLOR 
	vec4 tex_color = texture(TEXTURE, UV); // if using a particle texture COLOR = tex_color * WATER_COLOR; 
	}