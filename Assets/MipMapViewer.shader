Shader "Debug/MipMapViewer"
{
    Properties
    {
        [HideInInspector] _MainTex("Texture", 2D) = "white" {}
        [NoScaleOffset]   _Viewer ("Viewer",  2D) = "white" {}
        _LOD ("LOD", Range(0, 9)) = 0
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex vert_img
            #pragma fragment frag

            sampler2D _MainTex;
            sampler2D _Viewer;
            int _LOD;

            fixed4 frag(v2f_img input) : SV_Target
            {
                float4 color = tex2Dlod(_Viewer, float4(input.uv, 0, _LOD));
                return color;
            }

            ENDCG
        }
    }
}