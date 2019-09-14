  crt = love.graphics.newShader(
  [[
   extern vec2 distortionFactor;
    extern vec2 scaleFactor;
    extern number feather;
    vec4 effect(vec4 color, Image tex, vec2 uv, vec2 px) {
      // to barrel coordinates
      uv = uv * 2.0 - vec2(1.0);
      // distort
      uv *= scaleFactor;
      uv += (uv.yx*uv.yx) * uv * (distortionFactor - 1.0);
      number mask = (1.0 - smoothstep(1.0-feather,1.0,abs(uv.x)))
                  * (1.0 - smoothstep(1.0-feather,1.0,abs(uv.y)));
      // to cartesian coordinates
      uv = (uv + vec2(1.0)) / 2.0;
      return color * Texel(tex, uv) * mask;
    }
	]]
  )
  crt:send("scaleFactor",{1,1})
  crt:send("feather",0.02)
  crt:send("distortionFactor",{1.06, 1.065})

  halve = love.graphics.newShader(
  [[
    vec4 effect(vec4 color, Image tex, vec2 uv, vec2 sc ) {
	//float myx=	uv.x * love_ScreenSize.xy.x*1.0f;
	
	float v=sc.x;
	
	//if(mod(myx,2.0)<=0.1 ){
	  color=vec4(1.0*v,1.0,1.0,1.0);
	//}
      return color * Texel(tex, uv) ;
    }
	]]
  )
