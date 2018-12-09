﻿//
// Weather Maker for Unity
// (c) 2016 Digital Ruby, LLC
// Source code may be used for personal or commercial projects.
// Source code may NOT be redistributed or sold.
// 
// *** A NOTE ABOUT PIRACY ***
// 
// If you got this asset off of leak forums or any other horrible evil pirate site, please consider buying it from the Unity asset store at https ://www.assetstore.unity3d.com/en/#!/content/60955?aid=1011lGnL. This asset is only legally available from the Unity Asset Store.
// 
// I'm a single indie dev supporting my family by spending hundreds and thousands of hours on this and other assets. It's very offensive, rude and just plain evil to steal when I (and many others) put so much hard work into the software.
// 
// Thank you.
//
// *** END NOTE ABOUT PIRACY ***
//

Shader "WeatherMaker/WeatherMakerAnimated3DTextureShader"
{
	Properties
	{
		[NoScaleOffset] _MainTex3D ("Texture", 3D) = "white" {}
		_TintColor ("Tint Color", Color) = (1,1,1,1)
		_AlphaMultiplier ("Alpha Multiplier", Float) = 1.0
		_AlphaMultiplierAnimation ("Alpha Multiplier For Animation", Float) = 1.0
		_AlphaMultiplierAnimation2 ("Alpha Multiplier For Animation 2", Float) = 1.0
		_AnimationSpeed ("Animation Speed", Vector) = (0.01, 0.01, 1.0, 0.0)
		_InvertColor ("Invert Color", Int) = 0
		_PointSpotLightMultiplier("Point/Spot Light Multiplier", Range(0, 10)) = 1
		_DirectionalLightMultiplier("Directional Light Multiplier", Range(0, 10)) = 1
		_AmbientLightMultiplier("Ambient light multiplier", Range(0, 4)) = 1
		_SrcBlendMode("SrcBlendMode (Source Blend Mode)", Int) = 5 // SrcAlpha
		_DstBlendMode("DstBlendMode (Destination Blend Mode)", Int) = 10 // OneMinusSrcAlpha
		_WorldSpaceSampleScale("World space sample scale", Range(0.1, 3.0)) = 0.5
		_DistanceFade("Distance Fade Factor, higher values fade less", Range(0.01, 10.0)) = 3.0
	}
	SubShader
	{
		Tags{ "RenderType" = "Transparent" "IgnoreProjector" = "True" "Queue" = "Transparent" "LightMode" = "Always" }

		Pass
		{
			Blend [_SrcBlendMode][_DstBlendMode]
			ZTest LEqual
			Cull Back
			ZWrite Off

			CGPROGRAM

			#pragma target 3.0
			#pragma exclude_renderers gles
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_particles
			#pragma multi_compile_instancing

			#define WEATHER_MAKER_LIGHT_NO_NORMALS
			#define WEATHER_MAKER_LIGHT_NO_SPECULAR
			#define NULL_ZONE_RENDER_MASK 1 // precipitation is 1
			#define DEPTH_FADE 2.0 // DEPTH_FADE - (world pos - depth pos) distance, fade out entirely

			#include "WeatherMakerFogShader.cginc"
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				float4 uv : TEXCOORD0;
				float4 worldPos : TEXCOORD1;

#if defined(SOFTPARTICLES_ON)

				float4 screenPos : TEXCOORD2;

#endif

				WM_BASE_VERTEX_TO_FRAG
			};

			sampler3D _MainTex3D;
			float4 _MainTex3D_ST;
			fixed _AlphaMultiplier;
			fixed _AlphaMultiplierAnimation;
			fixed _AlphaMultiplierAnimation2;
			fixed4 _AnimationSpeed;
			fixed _InvertColor;
			fixed _WorldSpaceSampleScale;
			fixed _DistanceFade;

			v2f vert (vertex_uv_normal v)
			{
				WM_INSTANCE_VERT(v, v2f, o);

				o.vertex = UnityObjectToClipPos(v.vertex);

				o.worldPos.xyz = WorldSpaceVertexPos(v.vertex);
				float3 worldDistanceVector = _WorldSpaceCameraPos - o.worldPos.xyz;
				o.worldPos.w = length(worldDistanceVector);
				o.uv.w = saturate(_DistanceFade / o.worldPos.w);
				float4 axisAngle = float4(0.0, 1.0, 0.0, _WeatherMakerTime.x * _AnimationSpeed.w);
				float4 q = QuaternionFromAxisAngle(axisAngle.xyz, axisAngle.w);
				float2 posBase = (o.worldPos.xz + (RotatePointZeroOriginQuaternion(v.vertex, q).xz)) * _WorldSpaceSampleScale;
				o.uv.xyz = float3(posBase + (_AnimationSpeed.xy * _WeatherMakerTime.y), _WeatherMakerTime.y * _AnimationSpeed.z);

#if defined(SOFTPARTICLES_ON)

				o.screenPos = ComputeScreenPos(o.vertex);

#endif


				/* // Tried to position to match depth and height but running into too many glitches
#if SHADER_TARGET >= 30

				float4 projPos = ComputeScreenPos(o.vertex);
				float3 viewPos = UnityObjectToViewPos(v.vertex);
				float2 screenUV = projPos.xy / projPos.w;
				float depth = length(DECODE_EYEDEPTH(WM_SAMPLE_DEPTH(screenUV)) / normalize(viewPos).z);

				// move vertex in world space to new position based on depth
				float3 worldPosDepth = _WorldSpaceCameraPos + (depth * normalize(o.worldPos - _WorldSpaceCameraPos));
				float3 vertexLocal = v.vertex;
				vertexLocal.y += (worldPosDepth.y - o.worldPos.y);
				o.vertex = UnityObjectToClipPos(vertexLocal);

#endif
				*/

				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				WM_INSTANCE_FRAG(i);

				float fade = i.uv.w;
				clip(-0.0001 + fade);

#if defined(SOFTPARTICLES_ON)

				ClipWorldPosNullZones(i.worldPos.xyz);

#endif

				fixed4 col;
				col = tex3D(_MainTex3D, i.uv.xyz);
				col.rgb = ((1.0 - col.rgb) * _InvertColor) + ((1.0 - _InvertColor) * col.rgb);
				col.rgb *= (_TintColor.rgb * _TintColor.a);
				wm_world_space_light_params p;
				p.worldPos = i.worldPos.xyz;
				p.diffuseColor = col.rgb;
				p.ambientColor = _WeatherMakerAmbientLightColorGround;
				p.shadowStrength = 1.0;
				col.rgb = CalculateLightColorWorldSpace(p).rgb;
				col.a = saturate(col.a * fade * _AlphaMultiplier * _AlphaMultiplierAnimation * _AlphaMultiplierAnimation2);

#if defined(SOFTPARTICLES_ON)

				float sceneZ = LinearEyeDepth(WM_SAMPLE_DEPTH_PROJ(i.screenPos));
				col.a *= saturate(DEPTH_FADE - (sceneZ - i.worldPos.w)); // fade as the depth behind the puddle is bigger

#endif

				return col;
			}

			ENDCG
		}
	}
}