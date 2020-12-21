rootProject.name = "goal-app"

pluginManagement {
    val springBootPluginVersion: String by settings
    val springDependencyManagementPluginVersion: String by settings
    val jibVersion: String by settings

    resolutionStrategy {
        eachPlugin {
            when (requested.id.id) {
                "org.springframework.boot" -> useVersion(springBootPluginVersion)
                "io.spring.dependency-management" -> useVersion(springDependencyManagementPluginVersion)
                "com.google.cloud.tools.jib" -> useVersion(jibVersion)
            }
        }
    }
}
include("discovery")
include("config")
include("gateway")
