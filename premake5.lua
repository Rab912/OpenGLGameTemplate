workspace "OpenGLGameTemplate"
    architecture "x64"
    configurations { "Debug", "Release" }

project "OpenGLGameTemplate"
    kind "WindowedApp"
    language "C++"
    cppdialect "C++20"
    location "OpenGLGameTemplate"

    targetdir ("bin/%{cfg.architecture}-%{cfg.buildcfg}")
    objdir ("bin-int/%{cfg.architecture}-%{cfg.buildcfg}")

    files
    {
        "%{prj.name}/**.h",
        "%{prj.name}/**.hpp",
        "%{prj.name}/**.c",
        "%{prj.name}/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/Vendor/assimp/include",
        "%{prj.name}/Vendor/glad/include",
        "%{prj.name}/Vendor/glfw-3.4/include",
        "%{prj.name}/Vendor/glm-1.0.1",
        "%{prj.name}/Vendor/stb_image"
    }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
    
    filter "configurations:Release"
        optimize "On"

    filter "system:Windows"
        systemversion "latest"
        entrypoint "mainCRTStartup"
        defines { "WIN32" }

        libdirs
        {
            "%{prj.name}/Vendor/assimp/lib",
            "%{prj.name}/Vendor/glfw-3.4/lib-vc2022"
        }

        postbuildcommands
        {
            "xcopy /y \"$(ProjectDir)Vendor\\assimp\\lib\\*.dll\" \"$(OutDir)\""
        }

    filter {}

    links
    {
        "assimp-vc143-mt",
        "glfw3",
        "opengl32"
    }