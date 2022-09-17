project "FiberTaskingLib"
   kind "StaticLib"
   language "C++"
   cppdialect "C++17"
   targetdir "bin/%{cfg.buildcfg}"
   staticruntime "off"

   files { 
      "source/**.h",
      "source/**.cpp",
      "include/ftl/**.h",
    }

   includedirs
   {
      "include",
      "third_party/boost_context/include",
      "third_party/catch2/include",
      "third_party/nonius/include",
   }

   targetdir ("bin/" .. outputdir .. "/%{prj.name}")
   objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

   filter "architecture:x86_64"
      defines { "FTL_ARCH=x86_64" }

   filter "architecture:ARM"
      defines { "FTL_ARCH=arm" }

   filter "architecture:ARM64"
      defines { "FTL_ARCH=arm64" }

   filter "architecture:aarch64"
      defines { "FTL_ARCH=arm64" }

   filter "architecture:x86"
      defines { "FTL_ARCH=i386" }

   filter "architecture:i386"
      defines { "FTL_ARCH=i386" }

   filter "architecture:amd64"
      defines { "FTL_ARCH=x86_64" }

   filter "system:windows"
      systemversion "latest"
      defines {  }

   filter "configurations:Debug"
      defines {  }
      runtime "Debug"
      symbols "On"

   filter "configurations:Release"
      defines {  }
      runtime "Release"
      optimize "On"
      symbols "On"

   filter "configurations:Dist"
      kind "WindowedApp"
      runtime "Release"
      optimize "On"
      symbols "Off"