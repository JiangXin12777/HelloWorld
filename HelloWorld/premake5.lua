project "HelloWorld"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

--	pchheader "hzpch.h"
--	pchsource "src/hzpch.cpp"

	--
	files
	{
		"src/**.h",
		"src/**.cpp",
		"src/**.hpp",
		-- "vendor/stb_image/**.h",
		-- "vendor/stb_image/**.cpp",
		-- "vendor/glm/glm/**.hpp",
		-- "vendor/glm/glm/**.inl",
		-- "vendor/entt/**.hpp",
	}

	-- 宏预定义
	defines
	{
	}

	-- 头文件引用
	includedirs
	{
		"src",
		"src/Public",
		-- "vendor/spdlog/include",
	}

	-- 链接第三方库
-- 	links
-- 	{
-- 		"GLFW",
-- 		"Glad",
-- 		"ImGui",
-- 		"opengl32.lib",
-- 		"yaml-cpp",
-- 		"Box2D",
-- 	}
	
--	filter "files:vendor/ImGuizmo/**.cpp"
--	flags { "NoPCH" }

	filter "system:windows"
		systemversion "latest"

		defines
		{
		}

	filter "configurations:Debug"
		defines "HW_DEBUG"
		buildoptions "/utf-8"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "HW_RELEASE"
		buildoptions "/utf-8"
		runtime "Release"
		optimize "on"