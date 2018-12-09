// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:1,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5657439,fgcg:0.6941743,fgcb:0.8014706,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:True,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:2,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:8808,x:35825,y:32445,varname:node_8808,prsc:2|emission-256-OUT,clip-9176-OUT;n:type:ShaderForge.SFN_Slider,id:7344,x:31183,y:33467,ptovrint:False,ptlb:Transparency,ptin:_Transparency,varname:_Transparency,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:3166,x:32387,y:32716,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Set,id:6773,x:30598,y:33345,cmnt:This value ranges from 0 to 0.2,varname:Backside_Darkening,prsc:2|IN-9641-OUT;n:type:ShaderForge.SFN_Set,id:970,x:31524,y:33351,varname:Param_Cutoff,prsc:2|IN-2469-OUT;n:type:ShaderForge.SFN_Slider,id:2469,x:31183,y:33359,ptovrint:False,ptlb:Cutoff,ptin:_Cutoff,varname:_Cutoff,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7,max:1;n:type:ShaderForge.SFN_Set,id:9043,x:31524,y:33460,varname:Param_Transparency,prsc:2|IN-7344-OUT;n:type:ShaderForge.SFN_Get,id:9176,x:35595,y:32754,varname:node_9176,prsc:2|IN-8259-OUT;n:type:ShaderForge.SFN_Color,id:6756,x:33482,y:32781,ptovrint:False,ptlb:Color,ptin:_Color,cmnt:The input color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Code,id:5204,x:31193,y:34344,varname:node_5204,prsc:2,code:ZgBsAG8AYQB0ADQAeAA0ACAAbQB0AHgAIAA9ACAAZgBsAG8AYQB0ADQAeAA0ACgACgAJAGYAbABvAGEAdAA0ACgAMQAsACAAOQAsACAAMwAsACAAMQAxACkAIAAvACAAMQA3AC4AMAAsAAoACQBmAGwAbwBhAHQANAAoADEAMwAsACAANQAsACAAMQA1ACwAIAA3ACkAIAAvACAAMQA3AC4AMAAsAAoACQBmAGwAbwBhAHQANAAoADQALAAgADEAMgAsACAAMgAsACAAMQAwACkAIAAvACAAMQA3AC4AMAAsAAoACQBmAGwAbwBhAHQANAAoADEANgAsACAAOAAsACAAMQA0ACwAIAA2ACkAIAAvACAAMQA3AC4AMAAKACkAOwAKAGYAbABvAGEAdAAyACAAcAB4ACAAPQAgAGYAbABvAG8AcgAoAF8AUwBjAHIAZQBlAG4AUABhAHIAYQBtAHMALgB4AHkAIAAqACAAcwBjAHIAZQBlAG4AVQBWAHMAKQA7AAoAaQBuAHQAIAB4AFMAbQBwACAAPQAgAGYAbQBvAGQAKABwAHgALgB4ACwAIAA0ACkAOwAKAGkAbgB0ACAAeQBTAG0AcAAgAD0AIABmAG0AbwBkACgAcAB4AC4AeQAsACAANAApADsACgBmAGwAbwBhAHQANAAgAHgAVgBlAGMAIAA9ACAAMQAgAC0AIABzAGEAdAB1AHIAYQB0AGUAKABhAGIAcwAoAGYAbABvAGEAdAA0ACgAMAAsACAAMQAsACAAMgAsACAAMwApACAALQAgAHgAUwBtAHAAKQApADsACgBmAGwAbwBhAHQANAAgAHkAVgBlAGMAIAA9ACAAMQAgAC0AIABzAGEAdAB1AHIAYQB0AGUAKABhAGIAcwAoAGYAbABvAGEAdAA0ACgAMAAsACAAMQAsACAAMgAsACAAMwApACAALQAgAHkAUwBtAHAAKQApADsACgBmAGwAbwBhAHQANAAgAHAAeABNAHUAbAB0ACAAPQAgAGYAbABvAGEAdAA0ACgAZABvAHQAKABtAHQAeABbADAAXQAsACAAeQBWAGUAYwApACwAIABkAG8AdAAoAG0AdAB4AFsAMQBdACwAIAB5AFYAZQBjACkALAAgAGQAbwB0ACgAbQB0AHgAWwAyAF0ALAAgAHkAVgBlAGMAKQAsACAAZABvAHQAKABtAHQAeABbADMAXQAsACAAeQBWAGUAYwApACkAOwAKAHIAZQB0AHUAcgBuACAAZABvAHQAKABwAHgATQB1AGwAdAAsACAAeABWAGUAYwApADsA,output:0,fname:BinaryDither4x4_FOR_MAIN_PASS,width:760,height:213,input:1,input_1_label:screenUVs|A-8926-OUT;n:type:ShaderForge.SFN_Code,id:8926,x:30638,y:34343,varname:node_8926,prsc:2,code:IwBpAGYAIABVAE4ASQBUAFkAXwBVAFYAXwBTAFQAQQBSAFQAUwBfAEEAVABfAFQATwBQAA0ACgAJAGYAbABvAGEAdAAgAGcAcgBhAGIAUwBpAGcAbgAgAD0AIAAtAF8AUAByAG8AagBlAGMAdABpAG8AbgBQAGEAcgBhAG0AcwAuAHgAOwANAAoAIwBlAGwAcwBlAA0ACgAJAGYAbABvAGEAdAAgAGcAcgBhAGIAUwBpAGcAbgAgAD0AIABfAFAAcgBvAGoAZQBjAHQAaQBvAG4AUABhAHIAYQBtAHMALgB4ADsADQAKACMAZQBuAGQAaQBmAAoAcgBlAHQAdQByAG4AIABmAGwAbwBhAHQAMgAoADEALAAgAGcAcgBhAGIAUwBpAGcAbgApACoAcwBjAHIAZQBlAG4AUABvAHMALgB4AHkAKgAwAC4AMAAxADUAIAArACAAMAAuADAAMQA1ADsA,output:1,fname:GimmeScreenSpaceUV_MAINPASS,width:445,height:148,input:1,input_1_label:screenPos|A-5717-UVOUT;n:type:ShaderForge.SFN_ScreenPos,id:317,x:30348,y:34330,varname:node_317,prsc:2,sctp:0;n:type:ShaderForge.SFN_Code,id:7362,x:32350,y:34332,varname:node_7362,prsc:2,code:ZgBsAG8AYQB0ACAAQwBvAHMAZQByAHAAXwBSAGUAcwB1AGwAdAAgAD0AIAAoADEALgAwACAALQAgAGMAbwBzACgAKAB0AHIAYQBuAHMAKgAzAC4AMQA0ADEANQA5ADIANgA1ADQAKgAwAC4ANQApACkAKQA7ACAALwAvADwALQAtACAAcwBhAG0AZQAgAHQAaABpAG4AZwAgAGEAcwAgAE0AYQB0AGgAZgAuAEMAbwBzAGUAcgBwACgAKQAsACAAcwBlAGUAIABHAG8AbwBnAGwAZQAuACAAVABoAGkAcwAgAGgAZQBsAHAAcwAgAGYAYQBkAGUAIABpAG4AIAB0AGgAZQAgAGwAZQBhAHYAZQBzACAAbQBvAHIAZQAgAGcAcgBhAGQAdQBhAGwAbAB5ACAAYQB0ACAAZgBpAHIAcwB0ACwAIABpAG4AcwB0AGUAYQBkACAAbwBmACAAdABoAGUAbQAgAGEAcABwAGUAYQByAGkAbgBnACAAcwBvACAAcwB1AGQAZABlAG4AbAB5AC4ADQAKAGYAbABvAGEAdAAgAHIAZQBzAGMAYQBsAGUAZAAgAD0AIABsAGUAcgBwACgAMAAuADAANQA4ADgALAAgADEALgAwACwAIABDAG8AcwBlAHIAcABfAFIAZQBzAHUAbAB0ACkAOwAgAC8ALwA8AC0ALQAgAHIAZQBzAGMAYQBsAGUAcwAgAHQAaABlACAAdAByAGEAbgBzAGkAdABpAG8AbgAgAHQAbwAgAHIAYQBuAGcAZQAgAGYAcgBvAG0AIAAwAC4AMAA1ADgAOAAgAHQAbwAgADEALAAgAGkAbgBzAHQAZQBhAGQAIABvAGYAIABmAHIAbwBtACAAMAAgAHQAbwAgADEALAAgAHQAbwAgAHQAcgBpAG0AIABhACAAbABpAHQAdABsAGUAIAB3AGEAcwB0AGUAZAAgAGMAdQByAHYAZQAgAHMAcABhAGMAZQAgAG8AZgBmACAAdABoAGUAIABiAGUAZwBpAG4AbgBpAG4AZwAsACAAdABvACAAZQBuAHMAdQByAGUAIAB0AGgAYQB0ACAAdABoAGUAIABsAGUAYQB2AGUAcwAgAGIAZQBnAGkAbgAgAHQAbwAgAGEAcABwAGUAYQByACAAYQBzACAAcwBvAG8AbgAgAGEAcwAgAF8AVAByAGEAbgBzAHAAYQByAGUAbgBjAHkAIABpAHMAIABlAHYAZQBuACAAcwBsAGkAZwBoAHQAbAB5ACAAYQBiAG8AdgBlACAAegBlAHIAbwAgACgAbwB0AGgAZQByAHcAaQBzAGUAIAB0AGgAZQB5ACAAZABvAG4AJwB0ACAAZQB2AGUAbgAgAHMAdABhAHIAdAAgAHQAbwAgAGEAcABwAGUAYQByACAAdQBuAHQAaQBsACAAXwBUAHIAYQBuAHMAcABhAHIAZQBuAGMAeQAgAGkAcwAgAG4AZQBhAHIAbAB5ACAAMAAuADIAIQApAC4AIABFAEQASQBUADoAIAA5ADkAIAB3AG8AcgBrAHMAIABiAGUAdAB0AGUAcgAgAHQAaABhAG4AIAAxAC4ALgAuACAAaQB0ACAAZQBuAHMAdQByAGUAcwAgAGkAdAAgAGUAbgBkAHMAIAB1AHAAIABmAHUAbABsAHkAIABvAHAAYQBxAHUAZQAgAHcAaQB0AGgAIABuAG8AIABkAGkAdABoAGUAcgBpAG4AZwAgAHMAdABpAGwAbAAgAGwAaQBuAGcAZQByAGkAbgBnAC4ADQAKAGYAbABvAGEAdAAgAGQAaQB0AGgAZQByACAAPQAgAG0AYQB0AHIAaQB4AEkATgAgACsAIAAoAHIAZQBzAGMAYQBsAGUAZAAgAC0AIAAxAC4ANQApADsAIAAvAC8APAAtAC0AIABjAGEAbABjAHUAbABhAHQAZQBzACAAdABoAGUAIABkAGkAdABoAGUAcgBpAG4AZwAuAAoAcgBlAHQAdQByAG4AIABkAGkAdABoAGUAcgAgACsAIAAxAC4AMAA7AA==,output:0,fname:Dither_FOR_MAIN_PASS,width:505,height:128,input:0,input:0,input:0,input_1_label:matrixIN,input_2_label:cut_off,input_3_label:trans|A-5204-OUT,B-5626-OUT,C-6973-OUT;n:type:ShaderForge.SFN_Get,id:6973,x:32130,y:34443,varname:node_6973,prsc:2|IN-9043-OUT;n:type:ShaderForge.SFN_Get,id:5626,x:32130,y:34389,varname:node_5626,prsc:2|IN-970-OUT;n:type:ShaderForge.SFN_Set,id:8259,x:32939,y:34331,varname:Dither,prsc:2|IN-7362-OUT;n:type:ShaderForge.SFN_Set,id:7223,x:30726,y:32376,varname:LightIN,prsc:2|IN-1136-OUT;n:type:ShaderForge.SFN_Vector4Property,id:1420,x:29890,y:32667,ptovrint:False,ptlb:_LushLODTreeMainLightDir,ptin:_LushLODTreeMainLightDir,cmnt:The W is set via script in _LushLODTreesManager.cs,varname:node_8259,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5,v2:0.5,v3:0.5,v4:1;n:type:ShaderForge.SFN_Color,id:1583,x:29890,y:32371,ptovrint:False,ptlb:LushLODTreeMainLightCol,ptin:_LushLODTreeMainLightCol,cmnt:This works even with lightmaps,varname:node_349,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:3208,x:29890,y:32552,ptovrint:False,ptlb:LushLODTreeMainLightIntensity,ptin:_LushLODTreeMainLightIntensity,cmnt:This works even with lightmaps,varname:node_5384,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Set,id:1770,x:30214,y:32675,varname:LightDir,prsc:2|IN-1420-XYZ;n:type:ShaderForge.SFN_Dot,id:4385,x:31277,y:32330,cmnt:Is the sun above the horizon?,varname:node_4385,prsc:2,dt:0|A-9871-OUT,B-2797-OUT;n:type:ShaderForge.SFN_Get,id:2797,x:31044,y:32376,varname:node_2797,prsc:2|IN-1770-OUT;n:type:ShaderForge.SFN_Vector3,id:9871,x:31044,y:32263,cmnt:Checks if the light is shining straight down,varname:node_9871,prsc:2,v1:0,v2:1,v3:0;n:type:ShaderForge.SFN_Clamp01,id:1838,x:31841,y:32334,varname:node_1838,prsc:2|IN-3104-OUT;n:type:ShaderForge.SFN_Clamp01,id:696,x:32305,y:32178,varname:node_696,prsc:2|IN-7299-OUT;n:type:ShaderForge.SFN_Set,id:741,x:32873,y:32221,cmnt:This is an optional lighting adjustment you can remove this if your scene doesnt benefit from this.,varname:TimeOfDayIntensity,prsc:2|IN-4044-OUT;n:type:ShaderForge.SFN_Add,id:3104,x:31656,y:32334,cmnt:This makes the trees not get dark until the sun is somewhat BELOW the horizon.,varname:node_3104,prsc:2|A-4385-OUT,B-2800-OUT;n:type:ShaderForge.SFN_Vector1,id:2800,x:31468,y:32368,varname:node_2800,prsc:2,v1:0.25;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:7299,x:32104,y:32178,cmnt:Rescales it from 01 to about 03 to make it get brigher faster as the sun comes up. This effect is significantly stronger on the sunny side via backside darkening.,varname:node_7299,prsc:2|IN-1838-OUT,IMIN-7699-OUT,IMAX-429-OUT,OMIN-8844-OUT,OMAX-6080-OUT;n:type:ShaderForge.SFN_Vector1,id:7699,x:31841,y:32029,varname:node_7699,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:429,x:31841,y:32078,varname:node_429,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:8844,x:31841,y:32133,varname:node_8844,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:2665,x:31638,y:32089,varname:node_2665,prsc:2,v1:1.3;n:type:ShaderForge.SFN_Add,id:6080,x:31841,y:32183,varname:node_6080,prsc:2|A-2665-OUT,B-5974-OUT;n:type:ShaderForge.SFN_Get,id:8539,x:31461,y:32091,varname:node_8539,prsc:2|IN-6773-OUT;n:type:ShaderForge.SFN_Multiply,id:5974,x:31638,y:32155,varname:node_5974,prsc:2|A-8539-OUT,B-3614-OUT;n:type:ShaderForge.SFN_Vector1,id:3614,x:31461,y:32174,varname:node_3614,prsc:2,v1:2;n:type:ShaderForge.SFN_ViewVector,id:3644,x:30004,y:33188,varname:node_3644,prsc:2;n:type:ShaderForge.SFN_Dot,id:9641,x:30217,y:33279,cmnt:Check if view is opposite the direction of sunlight,varname:node_9641,prsc:2,dt:4|A-3644-OUT,B-2735-OUT;n:type:ShaderForge.SFN_RemapRange,id:5948,x:30394,y:33315,cmnt:Rescales it to 0.7 to 1 multiplied by 0.75 which yields 0.525 to 0.75,varname:node_5948,prsc:2,frmn:-1,frmx:1,tomn:0.525,tomx:0.75|IN-9641-OUT;n:type:ShaderForge.SFN_Get,id:2735,x:30004,y:33325,varname:node_2735,prsc:2|IN-1770-OUT;n:type:ShaderForge.SFN_TexCoord,id:5717,x:30328,y:34193,varname:node_5717,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1136,x:30504,y:32376,varname:node_1136,prsc:2|A-1583-RGB,B-7334-OUT;n:type:ShaderForge.SFN_Get,id:6668,x:34857,y:32778,varname:node_6668,prsc:2|IN-741-OUT;n:type:ShaderForge.SFN_NormalVector,id:8945,x:32922,y:33579,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:1143,x:33109,y:33612,cmnt:The Shadows Value,varname:node_1143,prsc:2,dt:1|A-8945-OUT,B-9013-OUT;n:type:ShaderForge.SFN_Get,id:9013,x:32896,y:33740,varname:node_9013,prsc:2|IN-1770-OUT;n:type:ShaderForge.SFN_Multiply,id:256,x:35231,y:32704,cmnt:Applies the time of day,varname:node_256,prsc:2|A-3895-OUT,B-6668-OUT;n:type:ShaderForge.SFN_Lerp,id:230,x:34279,y:32607,cmnt:Lerps towards the inut color based on how much the input color is LESS than WHITE.,varname:node_230,prsc:2|A-2753-OUT,B-4474-OUT,T-4459-OUT;n:type:ShaderForge.SFN_Min,id:4459,x:33712,y:33011,cmnt:Finds how much LESS than WHITE the iput color is,varname:node_4459,prsc:2|A-6756-R,B-6756-G,C-6756-B;n:type:ShaderForge.SFN_Multiply,id:9865,x:34279,y:32773,cmnt:Darkens the final color based on the input color.,varname:node_9865,prsc:2|A-4474-OUT,B-6756-RGB;n:type:ShaderForge.SFN_Lerp,id:3895,x:34878,y:32640,cmnt:If our input is grey we simply multiply by that grey to darken the final color without hurting the saturatio so much. But if our input is a color we lerp towards that color based upon how much that color is LESS than WHITE.,varname:node_3895,prsc:2|A-9865-OUT,B-230-OUT,T-8381-OUT;n:type:ShaderForge.SFN_Max,id:6536,x:33712,y:32851,cmnt:Finds the higest input color value,varname:node_6536,prsc:2|A-6756-R,B-6756-G,C-6756-B;n:type:ShaderForge.SFN_Subtract,id:8381,x:34279,y:32933,cmnt:Finds the difference between the highest and lowest color value. This is used to detect if our input color is simply a shade of grey and has no color.,varname:node_8381,prsc:2|A-6536-OUT,B-4459-OUT;n:type:ShaderForge.SFN_Multiply,id:2753,x:33752,y:32571,cmnt:The inut color multiplied by the texture color to give the iput color a texture so that it doesnt look flat,varname:node_2753,prsc:2|A-3166-RGB,B-6756-RGB;n:type:ShaderForge.SFN_Multiply,id:3784,x:33008,y:32955,varname:node_3784,prsc:2|A-3166-RGB,B-6780-OUT;n:type:ShaderForge.SFN_Get,id:8140,x:31763,y:32902,varname:node_8140,prsc:2|IN-7223-OUT;n:type:ShaderForge.SFN_Lerp,id:4474,x:33652,y:33212,cmnt:The final color with the shadows and the ambient tint applied to the shadows,varname:node_4474,prsc:2|A-4483-OUT,B-3784-OUT,T-2019-OUT;n:type:ShaderForge.SFN_Multiply,id:4483,x:33310,y:33304,cmnt:Darkens the ambient,varname:node_4483,prsc:2|A-8672-OUT,B-7394-OUT;n:type:ShaderForge.SFN_Vector1,id:7394,x:33096,y:33398,varname:node_7394,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Blend,id:8672,x:33096,y:33220,varname:node_8672,prsc:2,blmd:1,clmp:False|SRC-2506-RGB,DST-3166-RGB;n:type:ShaderForge.SFN_Add,id:6780,x:32004,y:32878,varname:node_6780,prsc:2|A-8140-OUT,B-2506-RGB;n:type:ShaderForge.SFN_Divide,id:7334,x:30307,y:32479,varname:node_7334,prsc:2|A-3208-OUT,B-1763-OUT;n:type:ShaderForge.SFN_Vector1,id:1763,x:30089,y:32552,varname:node_1763,prsc:2,v1:1.2;n:type:ShaderForge.SFN_Color,id:2506,x:31727,y:33086,ptovrint:False,ptlb:_LushLODTreeAmbientColor,ptin:_LushLODTreeAmbientColor,cmnt:_LushLODTreeAmbientColor... this value is set in the manager,varname:_LushLODTreeAmbientColor_copy,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:4044,x:32635,y:32312,cmnt:Lets the user adjust the tie of day correction,varname:node_4044,prsc:2|A-4809-OUT,B-696-OUT,T-6519-OUT;n:type:ShaderForge.SFN_Vector1,id:4809,x:32388,y:32312,varname:node_4809,prsc:2,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:6519,x:32388,y:32384,ptovrint:False,ptlb:LushLODTreeTimeOfDay,ptin:_LushLODTreeTimeOfDay,varname:node_5174,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Clamp,id:2019,x:33308,y:33740,cmnt:This lets the user adjust te maximum shadow. A value of 0.5 will limit it to half.,varname:node_2019,prsc:2|IN-1143-OUT,MIN-110-OUT,MAX-3273-OUT;n:type:ShaderForge.SFN_Vector1,id:3273,x:33000,y:33834,varname:node_3273,prsc:2,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:5871,x:32879,y:33945,ptovrint:False,ptlb:_LushLODTreeShadowDarkness,ptin:_LushLODTreeShadowDarkness,cmnt:_LusLODSadowDarkness... this is cotrolled by the manager in its Update function,varname:node_2612,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_OneMinus,id:110,x:33078,y:33945,varname:node_110,prsc:2|IN-5871-OUT;proporder:7344-3166-2469-6756;pass:END;sub:END;*/

Shader "Hidden/LushLODTree/HQTreeBark_SimpleShadows_Deferred" {
    Properties {
        _Transparency ("Transparency", Range(0, 1)) = 0
        _MainTex ("MainTex", 2D) = "white" {}
        _Cutoff ("Cutoff", Range(0, 1)) = 0.7
        _Color ("Color", Color) = (1,1,1,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        LOD 100
        Pass {
            Name "DEFERRED"
            Tags {
                "LightMode"="Deferred"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_DEFERRED
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile ___ UNITY_HDR_ON
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform float _Transparency;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Cutoff;
            uniform float4 _Color;
            float BinaryDither4x4_FOR_MAIN_PASS( float2 screenUVs ){
            float4x4 mtx = float4x4(
            	float4(1, 9, 3, 11) / 17.0,
            	float4(13, 5, 15, 7) / 17.0,
            	float4(4, 12, 2, 10) / 17.0,
            	float4(16, 8, 14, 6) / 17.0
            );
            float2 px = floor(_ScreenParams.xy * screenUVs);
            int xSmp = fmod(px.x, 4);
            int ySmp = fmod(px.y, 4);
            float4 xVec = 1 - saturate(abs(float4(0, 1, 2, 3) - xSmp));
            float4 yVec = 1 - saturate(abs(float4(0, 1, 2, 3) - ySmp));
            float4 pxMult = float4(dot(mtx[0], yVec), dot(mtx[1], yVec), dot(mtx[2], yVec), dot(mtx[3], yVec));
            return dot(pxMult, xVec);
            }
            
            float2 GimmeScreenSpaceUV_MAINPASS( float2 screenPos ){
            #if UNITY_UV_STARTS_AT_TOP
            	float grabSign = -_ProjectionParams.x;
            #else
            	float grabSign = _ProjectionParams.x;
            #endif
            return float2(1, grabSign)*screenPos.xy*0.015 + 0.015;
            }
            
            float Dither_FOR_MAIN_PASS( float matrixIN , float cut_off , float trans ){
            float Coserp_Result = (1.0 - cos((trans*3.141592654*0.5))); //<-- same thing as Mathf.Coserp(), see Google. This helps fade in the leaves more gradually at first, instead of them appearing so suddenly.
            float rescaled = lerp(0.0588, 1.0, Coserp_Result); //<-- rescales the transition to range from 0.0588 to 1, instead of from 0 to 1, to trim a little wasted curve space off the beginning, to ensure that the leaves begin to appear as soon as _Transparency is even slightly above zero (otherwise they don't even start to appear until _Transparency is nearly 0.2!). EDIT: 99 works better than 1... it ensures it ends up fully opaque with no dithering still lingering.
            float dither = matrixIN + (rescaled - 1.5); //<-- calculates the dithering.
            return dither + 1.0;
            }
            
            uniform float4 _LushLODTreeMainLightDir;
            uniform float4 _LushLODTreeMainLightCol;
            uniform float _LushLODTreeMainLightIntensity;
            uniform float4 _LushLODTreeAmbientColor;
            uniform float _LushLODTreeTimeOfDay;
            uniform float _LushLODTreeShadowDarkness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            void frag(
                VertexOutput i,
                out half4 outDiffuse : SV_Target0,
                out half4 outSpecSmoothness : SV_Target1,
                out half4 outNormal : SV_Target2,
                out half4 outEmission : SV_Target3 )
            {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float Param_Cutoff = _Cutoff;
                float Param_Transparency = _Transparency;
                float Dither = Dither_FOR_MAIN_PASS( BinaryDither4x4_FOR_MAIN_PASS( GimmeScreenSpaceUV_MAINPASS( i.uv0 ) ) , Param_Cutoff , Param_Transparency );
                clip(Dither - 0.5);
////// Lighting:
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 LightIN = (_LushLODTreeMainLightCol.rgb*(_LushLODTreeMainLightIntensity/1.2));
                float3 LightDir = _LushLODTreeMainLightDir.rgb;
                float3 node_4474 = lerp(((_LushLODTreeAmbientColor.rgb*_MainTex_var.rgb)*0.8),(_MainTex_var.rgb*(LightIN+_LushLODTreeAmbientColor.rgb)),clamp(max(0,dot(i.normalDir,LightDir)),(1.0 - _LushLODTreeShadowDarkness),1.0)); // The final color with the shadows and the ambient tint applied to the shadows
                float node_4459 = min(min(_Color.r,_Color.g),_Color.b); // Finds how much LESS than WHITE the iput color is
                float node_7699 = 0.0;
                float node_8844 = 0.0;
                float node_9641 = 0.5*dot(viewDirection,LightDir)+0.5; // Check if view is opposite the direction of sunlight
                float Backside_Darkening = node_9641; // This value ranges from 0 to 0.2
                float TimeOfDayIntensity = lerp(1.0,saturate((node_8844 + ( (saturate((dot(float3(0,1,0),LightDir)+0.25)) - node_7699) * ((1.3+(Backside_Darkening*2.0)) - node_8844) ) / (1.0 - node_7699))),_LushLODTreeTimeOfDay); // This is an optional lighting adjustment you can remove this if your scene doesnt benefit from this.
                float3 emissive = (lerp((node_4474*_Color.rgb),lerp((_MainTex_var.rgb*_Color.rgb),node_4474,node_4459),(max(max(_Color.r,_Color.g),_Color.b)-node_4459))*TimeOfDayIntensity);
                float3 finalColor = emissive;
                outDiffuse = half4( 0, 0, 0, 1 );
                outSpecSmoothness = half4(0,0,0,0);
                outNormal = half4( normalDirection * 0.5 + 0.5, 1 );
                outEmission = half4( (lerp((node_4474*_Color.rgb),lerp((_MainTex_var.rgb*_Color.rgb),node_4474,node_4459),(max(max(_Color.r,_Color.g),_Color.b)-node_4459))*TimeOfDayIntensity), 1 );
                #ifndef UNITY_HDR_ON
                    outEmission.rgb = exp2(-outEmission.rgb);
                #endif
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            Stencil {
                Ref 128
                Pass Replace
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform float _Transparency;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Cutoff;
            uniform float4 _Color;
            float BinaryDither4x4_FOR_MAIN_PASS( float2 screenUVs ){
            float4x4 mtx = float4x4(
            	float4(1, 9, 3, 11) / 17.0,
            	float4(13, 5, 15, 7) / 17.0,
            	float4(4, 12, 2, 10) / 17.0,
            	float4(16, 8, 14, 6) / 17.0
            );
            float2 px = floor(_ScreenParams.xy * screenUVs);
            int xSmp = fmod(px.x, 4);
            int ySmp = fmod(px.y, 4);
            float4 xVec = 1 - saturate(abs(float4(0, 1, 2, 3) - xSmp));
            float4 yVec = 1 - saturate(abs(float4(0, 1, 2, 3) - ySmp));
            float4 pxMult = float4(dot(mtx[0], yVec), dot(mtx[1], yVec), dot(mtx[2], yVec), dot(mtx[3], yVec));
            return dot(pxMult, xVec);
            }
            
            float2 GimmeScreenSpaceUV_MAINPASS( float2 screenPos ){
            #if UNITY_UV_STARTS_AT_TOP
            	float grabSign = -_ProjectionParams.x;
            #else
            	float grabSign = _ProjectionParams.x;
            #endif
            return float2(1, grabSign)*screenPos.xy*0.015 + 0.015;
            }
            
            float Dither_FOR_MAIN_PASS( float matrixIN , float cut_off , float trans ){
            float Coserp_Result = (1.0 - cos((trans*3.141592654*0.5))); //<-- same thing as Mathf.Coserp(), see Google. This helps fade in the leaves more gradually at first, instead of them appearing so suddenly.
            float rescaled = lerp(0.0588, 1.0, Coserp_Result); //<-- rescales the transition to range from 0.0588 to 1, instead of from 0 to 1, to trim a little wasted curve space off the beginning, to ensure that the leaves begin to appear as soon as _Transparency is even slightly above zero (otherwise they don't even start to appear until _Transparency is nearly 0.2!). EDIT: 99 works better than 1... it ensures it ends up fully opaque with no dithering still lingering.
            float dither = matrixIN + (rescaled - 1.5); //<-- calculates the dithering.
            return dither + 1.0;
            }
            
            uniform float4 _LushLODTreeMainLightDir;
            uniform float4 _LushLODTreeMainLightCol;
            uniform float _LushLODTreeMainLightIntensity;
            uniform float4 _LushLODTreeAmbientColor;
            uniform float _LushLODTreeTimeOfDay;
            uniform float _LushLODTreeShadowDarkness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float Param_Cutoff = _Cutoff;
                float Param_Transparency = _Transparency;
                float Dither = Dither_FOR_MAIN_PASS( BinaryDither4x4_FOR_MAIN_PASS( GimmeScreenSpaceUV_MAINPASS( i.uv0 ) ) , Param_Cutoff , Param_Transparency );
                clip(Dither - 0.5);
////// Lighting:
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 LightIN = (_LushLODTreeMainLightCol.rgb*(_LushLODTreeMainLightIntensity/1.2));
                float3 LightDir = _LushLODTreeMainLightDir.rgb;
                float3 node_4474 = lerp(((_LushLODTreeAmbientColor.rgb*_MainTex_var.rgb)*0.8),(_MainTex_var.rgb*(LightIN+_LushLODTreeAmbientColor.rgb)),clamp(max(0,dot(i.normalDir,LightDir)),(1.0 - _LushLODTreeShadowDarkness),1.0)); // The final color with the shadows and the ambient tint applied to the shadows
                float node_4459 = min(min(_Color.r,_Color.g),_Color.b); // Finds how much LESS than WHITE the iput color is
                float node_7699 = 0.0;
                float node_8844 = 0.0;
                float node_9641 = 0.5*dot(viewDirection,LightDir)+0.5; // Check if view is opposite the direction of sunlight
                float Backside_Darkening = node_9641; // This value ranges from 0 to 0.2
                float TimeOfDayIntensity = lerp(1.0,saturate((node_8844 + ( (saturate((dot(float3(0,1,0),LightDir)+0.25)) - node_7699) * ((1.3+(Backside_Darkening*2.0)) - node_8844) ) / (1.0 - node_7699))),_LushLODTreeTimeOfDay); // This is an optional lighting adjustment you can remove this if your scene doesnt benefit from this.
                float3 emissive = (lerp((node_4474*_Color.rgb),lerp((_MainTex_var.rgb*_Color.rgb),node_4474,node_4459),(max(max(_Color.r,_Color.g),_Color.b)-node_4459))*TimeOfDayIntensity);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform float _Transparency;
            uniform float _Cutoff;
            float BinaryDither4x4_FOR_MAIN_PASS( float2 screenUVs ){
            float4x4 mtx = float4x4(
            	float4(1, 9, 3, 11) / 17.0,
            	float4(13, 5, 15, 7) / 17.0,
            	float4(4, 12, 2, 10) / 17.0,
            	float4(16, 8, 14, 6) / 17.0
            );
            float2 px = floor(_ScreenParams.xy * screenUVs);
            int xSmp = fmod(px.x, 4);
            int ySmp = fmod(px.y, 4);
            float4 xVec = 1 - saturate(abs(float4(0, 1, 2, 3) - xSmp));
            float4 yVec = 1 - saturate(abs(float4(0, 1, 2, 3) - ySmp));
            float4 pxMult = float4(dot(mtx[0], yVec), dot(mtx[1], yVec), dot(mtx[2], yVec), dot(mtx[3], yVec));
            return dot(pxMult, xVec);
            }
            
            float2 GimmeScreenSpaceUV_MAINPASS( float2 screenPos ){
            #if UNITY_UV_STARTS_AT_TOP
            	float grabSign = -_ProjectionParams.x;
            #else
            	float grabSign = _ProjectionParams.x;
            #endif
            return float2(1, grabSign)*screenPos.xy*0.015 + 0.015;
            }
            
            float Dither_FOR_MAIN_PASS( float matrixIN , float cut_off , float trans ){
            float Coserp_Result = (1.0 - cos((trans*3.141592654*0.5))); //<-- same thing as Mathf.Coserp(), see Google. This helps fade in the leaves more gradually at first, instead of them appearing so suddenly.
            float rescaled = lerp(0.0588, 1.0, Coserp_Result); //<-- rescales the transition to range from 0.0588 to 1, instead of from 0 to 1, to trim a little wasted curve space off the beginning, to ensure that the leaves begin to appear as soon as _Transparency is even slightly above zero (otherwise they don't even start to appear until _Transparency is nearly 0.2!). EDIT: 99 works better than 1... it ensures it ends up fully opaque with no dithering still lingering.
            float dither = matrixIN + (rescaled - 1.5); //<-- calculates the dithering.
            return dither + 1.0;
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float Param_Cutoff = _Cutoff;
                float Param_Transparency = _Transparency;
                float Dither = Dither_FOR_MAIN_PASS( BinaryDither4x4_FOR_MAIN_PASS( GimmeScreenSpaceUV_MAINPASS( i.uv0 ) ) , Param_Cutoff , Param_Transparency );
                clip(Dither - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}