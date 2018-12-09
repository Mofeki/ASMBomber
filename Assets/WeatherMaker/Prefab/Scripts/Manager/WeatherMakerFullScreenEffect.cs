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

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

namespace DigitalRuby.WeatherMaker
{
    [System.Serializable]
    public class WeatherMakerFullScreenEffect : System.IDisposable
    {
        [Tooltip("Render queue for this full screen effect. Do not change this at runtime, set it in the inspector once.")]
        public CameraEvent RenderQueue = CameraEvent.BeforeForwardAlpha;

        [Tooltip("Material for rendering/creating the effect")]
        public Material Material;

        [Tooltip("Material for blurring")]
        public Material BlurMaterial;

        [Tooltip("Material to render the final pass if needed, not all setups will need this but it should be set anyway")]
        public Material BlitMaterial;

        [Tooltip("Downsample scale for Material")]
        [Range(0.01f, 1.0f)]
        public float DownsampleScale = 1.0f;
        private float lastDownSampleScale = -1.0f;

        [Tooltip("Downsample scale for render buffer sampling, or 0 to not sample the render buffer.")]
        [Range(0.0f, 1.0f)]
        public float DownsampleRenderBufferScale = 0.0f;
        private float lastDownsampleRenderBufferScale = -1.0f;

        [Tooltip("Name of the texture to set if sampling the render buffer")]
        public string DownsampleRenderBufferTextureName;

        [Tooltip("Blur shader type")]
        public BlurShaderType BlurShaderType = BlurShaderType.None;
        private BlurShaderType lastBlurShaderType = (BlurShaderType)0x7FFFFFFF;

        [Tooltip("ZTest")]
        public UnityEngine.Rendering.CompareFunction ZTest = CompareFunction.Always;

        /// <summary>
        /// The name for the command buffer that will be created for this effect. This should be unique for your project.
        /// </summary>
        public string CommandBufferName { get; set; }

        /// <summary>
        /// Whether the effect is enabled. The effect can be disabled to prevent command buffers from being created.
        /// </summary>
        public bool Enabled { get; set; }

        /// <summary>
        /// Action to fire when Material properties should be updated
        /// </summary>
        public System.Action<WeatherMakerCommandBuffer> UpdateMaterialProperties { get; set; }

        internal bool needsToBeRecreated;
        private readonly List<Camera> cameras = new List<Camera>();
        private static readonly string[] cameraStringsForReflection = new string[] { "mirror", "water", "refl" };
        private static readonly string[] cameraStringsForCubeMap = new string[] { "probe" };
        private static readonly string[] cameraStringsForOther = new string[] { "prerender" };

        public static WeatherMakerCameraType GetCameraType(Camera c)
        {
            string name = c.CachedName();
            foreach (string s in cameraStringsForCubeMap)
            {
                if (name.IndexOf(s, System.StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    return WeatherMakerCameraType.CubeMap;
                }
            }
            foreach (string s in cameraStringsForReflection)
            {
                if (name.IndexOf(s, System.StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    return WeatherMakerCameraType.Reflection;
                }
            }
            foreach (string s in cameraStringsForOther)
            {
                if (name.IndexOf(s, System.StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    return WeatherMakerCameraType.PreRender;
                }
            }
            return WeatherMakerCameraType.Normal;
        }

#if UNITY_2018_2_OR_NEWER

        private RenderTextureDescriptor GetRenderTextureDescriptor(float scale)
        {
            RenderTextureDescriptor desc = (UnityEngine.XR.XRDevice.isPresent) ? UnityEngine.XR.XRSettings.eyeTextureDesc : new RenderTextureDescriptor(Screen.width, Screen.height, RenderTextureFormat.ARGB32, 0);
            if (scale > 0.0f)
            {
                desc.width = (int)(desc.width * scale);
                desc.height = (int)(desc.height * scale);
            }
            return desc;
        }

#endif

        internal static RenderTexture CreateRenderTexture(float scale)
        {

#if UNITY_2018_2_OR_NEWER

            RenderTextureDescriptor desc = (UnityEngine.XR.XRDevice.isPresent) ? UnityEngine.XR.XRSettings.eyeTextureDesc : new RenderTextureDescriptor(Screen.width, Screen.height, RenderTextureFormat.ARGB32, 0);
            if (scale > 0.0f)
            {
                desc.width = (int)(desc.width * scale);
                desc.height = (int)(desc.height * scale);
            }
            return null;

#else

            return new RenderTexture((int)(Screen.width * scale), (int)(Screen.height * scale), 0, RenderTextureFormat.ARGB32, RenderTextureReadWrite.Default); 

#endif

        }

        private void CreateCommandBuffer(Camera camera)
        {
            if (WeatherMakerScript.Instance == null)
            {
                Debug.LogError("Cannot create command buffer, WeatherMakerScript.Instance is null");
                return;
            }

            CommandBuffer commandBuffer = new CommandBuffer { name = CommandBufferName };
            //commandBuffer.SetViewMatrix(Matrix4x4.Ortho(0.0f, 1.0f, 0.0f, 1.0f, camera.farClipPlane, camera.farClipPlane));
            int frameBufferSourceId = -1;

#if UNITY_2018_2_OR_NEWER

            RenderTexture temp = new RenderTexture(GetRenderTextureDescriptor(1.0f));
            RenderTargetIdentifier frameBufferSource = new RenderTargetIdentifier(temp);

#else

            RenderTargetIdentifier frameBufferSource = new RenderTargetIdentifier(BuiltinRenderTextureType.None);

#endif

            Material material = new Material(Material);
            material.name += " (Clone)";

            //tmpHdr = new Texture2D(64, 64, TextureFormat.RGBAHalf, false, false);
            //tmpNonHdr = new Texture2D(64, 64, TextureFormat.ARGB32, false, false);

            if (DownsampleRenderBufferScale > 0.0f)
            {
                // render camera target to texture, performing separate down-sampling
                frameBufferSourceId = Shader.PropertyToID(DownsampleRenderBufferTextureName);
                frameBufferSource = new RenderTargetIdentifier(frameBufferSourceId);

#if UNITY_2018_2_OR_NEWER

                commandBuffer.GetTemporaryRT(frameBufferSourceId, GetRenderTextureDescriptor(DownsampleRenderBufferScale), FilterMode.Bilinear);

#else

                commandBuffer.GetTemporaryRT(frameBufferSourceId, (int)(Screen.width * DownsampleRenderBufferScale), (int)(Screen.height * DownsampleRenderBufferScale), 0, FilterMode.Bilinear, RenderTextureFormat.ARGB32);

#endif

                commandBuffer.Blit(BuiltinRenderTextureType.CameraTarget, frameBufferSource, null);
            }

            if (BlurShaderType == BlurShaderType.None && DownsampleScale >= 0.99f)
            {
                // draw directly to render target
                material.SetInt("_SrcBlendMode", (int)BlendMode.One);
                material.SetInt("_DstBlendMode", (int)BlendMode.OneMinusSrcAlpha);
                material.SetInt("_ZTest", (int)ZTest);
                commandBuffer.Blit(frameBufferSource, BuiltinRenderTextureType.CameraTarget, material);
            }
            else
            {
                // render to texture, using current image target as input _MainTex, no blend
                int intermediateRenderTargetId = Shader.PropertyToID("_MainTex");
                RenderTargetIdentifier intermediateRenderTarget = new RenderTargetIdentifier(intermediateRenderTargetId);

#if UNITY_2018_2_OR_NEWER

                commandBuffer.GetTemporaryRT(intermediateRenderTargetId, GetRenderTextureDescriptor(DownsampleScale), FilterMode.Bilinear);

#else

                commandBuffer.GetTemporaryRT(intermediateRenderTargetId, (int)(Screen.width * DownsampleScale), (int)(Screen.height * DownsampleScale), 0, FilterMode.Bilinear, RenderTextureFormat.ARGB32);

#endif

                material.SetInt("_SrcBlendMode", (int)BlendMode.One);
                material.SetInt("_DstBlendMode", (int)BlendMode.Zero);
                material.SetInt("_ZTest", (int)ZTest);
                commandBuffer.Blit(frameBufferSource, intermediateRenderTarget, material);

                // blur if requested
                if (BlurShaderType == BlurShaderType.None)
                {
                    // blit texture directly on top of camera, alpha blend
                    BlitMaterial.SetInt("_SrcBlendMode", (int)BlendMode.One);
                    BlitMaterial.SetInt("_DstBlendMode", (int)BlendMode.OneMinusSrcAlpha);
                    BlitMaterial.SetInt("_ZTest", (int)ZTest);
                    commandBuffer.Blit(intermediateRenderTarget, BuiltinRenderTextureType.CameraTarget, BlitMaterial);
                }
                else
                {
                    // blur texture directly on to camera target, alpha blend
                    BlurMaterial.SetInt("_SrcBlendMode", (int)BlendMode.One);
                    BlurMaterial.SetInt("_DstBlendMode", (int)BlendMode.OneMinusSrcAlpha);
                    if (BlurShaderType == BlurShaderType.GaussianBlur7)
                    {
                        BlurMaterial.EnableKeyword("BLUR7");
                    }
                    else
                    {
                        BlurMaterial.DisableKeyword("BLUR7");
                    }
                    BlurMaterial.SetInt("_ZTest", (int)ZTest);
                    commandBuffer.Blit(intermediateRenderTarget, BuiltinRenderTextureType.CameraTarget, BlurMaterial);
                }

                // cleanup
                commandBuffer.ReleaseTemporaryRT(intermediateRenderTargetId);
            }

            if (DownsampleRenderBufferScale > 0.0f)
            {
                // cleanup
                commandBuffer.ReleaseTemporaryRT(frameBufferSourceId);
            }

            // add to manager
            WeatherMakerCommandBuffer weatherMakerCommandBuffer = new WeatherMakerCommandBuffer
            {
                Camera = camera,
                CommandBuffer = commandBuffer,
                Material = material,
                RenderQueue = RenderQueue,
                UpdateMaterial = UpdateMaterialProperties,
                CameraType = GetCameraType(camera)
            };
            WeatherMakerScript.Instance.CommandBufferManager.AddCommandBuffer(weatherMakerCommandBuffer);
            cameras.Add(camera);
        }

        /// <summary>
        /// Call from LateUpdate in script
        /// </summary>
        public void SetupEffect(Material material, Material blitMaterial, Material blurMaterial, BlurShaderType blurShaderType, float downSampleScale,
            float downsampleRenderBufferScale, System.Action<WeatherMakerCommandBuffer> updateMaterialProperties, bool enabled)
        {
            Enabled = enabled;
            if (Enabled)
            {
                if (material != Material)
                {
                    Material = material;
                }
                if (BlitMaterial != blitMaterial)
                {
                    BlitMaterial = blitMaterial;
                }
                if (BlurMaterial != blurMaterial)
                {
                    BlurMaterial = blurMaterial;
                }
                BlurShaderType = blurShaderType;
                DownsampleScale = downSampleScale;
                DownsampleRenderBufferScale = downsampleRenderBufferScale;
                if (UpdateMaterialProperties != updateMaterialProperties)
                {
                    UpdateMaterialProperties = updateMaterialProperties;
                }
                needsToBeRecreated = lastDownSampleScale != DownsampleScale ||
                    lastDownsampleRenderBufferScale != DownsampleRenderBufferScale ||
                    lastBlurShaderType != BlurShaderType;
                lastDownSampleScale = DownsampleScale;
                lastDownsampleRenderBufferScale = DownsampleRenderBufferScale;
                lastBlurShaderType = BlurShaderType;
            }
            else
            {
                Dispose();
            }
        }

        /// <summary>
        /// Update the full screen effect, usually called from OnPreRender or OnPreCull
        /// </summary>
        /// <param name="camera">Camera</param>
        public void SetupCamera(Camera camera)
        {
            if (WeatherMakerScript.Instance != null &&
                Enabled && Material != null && (needsToBeRecreated || !WeatherMakerScript.Instance.CommandBufferManager.ContainsCommandBuffer(camera, RenderQueue, CommandBufferName)))
            {
                string name = camera.CachedName();
                if (name.IndexOf("effects", System.StringComparison.OrdinalIgnoreCase) < 0 && name.IndexOf("preview", System.StringComparison.OrdinalIgnoreCase) < 0)
                {
                    CreateCommandBuffer(camera);
                }
            }
        }

        /// <summary>
        /// Cleanup all resources and set Enabled to false
        /// </summary>
        public void Dispose()
        {
            lastDownSampleScale = -1.0f;
            lastDownsampleRenderBufferScale = -1.0f;
            lastBlurShaderType = (BlurShaderType)0x7FFFFFFF;
            if (WeatherMakerScript.Instance != null)
            {
                foreach (Camera c in cameras)
                {
                    if (c != null)
                    {
                        WeatherMakerScript.Instance.CommandBufferManager.RemoveCommandBuffer(c, CommandBufferName);
                    }
                }
            }
            cameras.Clear();
            Enabled = false;
        }
    }
}