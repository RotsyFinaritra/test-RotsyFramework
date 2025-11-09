#!/bin/bash
set -e

# ----------------------------
# CONFIGURATION
# ----------------------------
PROJECT_NAME="test-RotsyFramework"
SRC_DIR="./src"                         
WEBAPP_DIR="./webapp"                    # ici : tes fichiers JSP, HTML, etc.
BUILD_DIR="./build"                      
WEBINF_DIR="$BUILD_DIR/WEB-INF"
CLASSES_DIR="$WEBINF_DIR/classes"
LIB_DIR="$WEBINF_DIR/lib"
TARGET_DIR="./target"
TOMCAT_PATH="/opt/apache-tomcat-10.1.28/webapps"

# Chemin vers ton framework JAR
FRAMEWORK_JAR="./lib/my-framework.jar"

mkdir -p "$CLASSES_DIR" "$LIB_DIR" "$TARGET_DIR"

# ----------------------------
# 1. Compilation des sources
# ----------------------------
echo "Compiling Java sources..."
CLASSPATH="$FRAMEWORK_JAR:$CLASSES_DIR"
find $SRC_DIR -name "*.java" > sources.txt
javac -cp "$CLASSPATH" -d "$CLASSES_DIR" @sources.txt
echo "Compilation done. Classes are in $CLASSES_DIR"

# ----------------------------
# 2. Copier les fichiers web (JSP, HTML, etc.)
# ----------------------------
if [ -d "$WEBAPP_DIR" ]; then
  echo "Copying web files from $WEBAPP_DIR..."
  cp -r "$WEBAPP_DIR"/* "$BUILD_DIR"/
fi

# ----------------------------
# 3. Copier les libs (framework + autres)
# ----------------------------
cp "$FRAMEWORK_JAR" "$LIB_DIR"
# cp ./lib/*.jar "$LIB_DIR"  # si tu en as d'autres

# ----------------------------
# 4. Créer le WAR
# ----------------------------
echo "Creating WAR file..."
jar cf "$TARGET_DIR/$PROJECT_NAME.war" -C "$BUILD_DIR" .
echo "WAR created: $TARGET_DIR/$PROJECT_NAME.war"

# ----------------------------
# 5. Déploiement dans Tomcat
# ----------------------------
echo "Deploying WAR to Tomcat..."
cp "$TARGET_DIR/$PROJECT_NAME.war" "$TOMCAT_PATH"
echo "WAR deployed to $TOMCAT_PATH"

# ----------------------------
# 6. Nettoyage temporaire
# ----------------------------
rm sources.txt
echo "Build and deploy finished successfully."
