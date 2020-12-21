allprojects {
    group =  "goal-app"
}

repositories {
    mavenCentral()
}

plugins {
    java
}

configure<JavaPluginConvention> {
    sourceCompatibility = JavaVersion.VERSION_11
}
