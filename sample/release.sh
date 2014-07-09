#/bin/bash
#keytool -genkey -v -keystore release-key.keystore -alias photosasa -keyalg RSA -keysize 2048 -validity 10000
rm bin/youyou-release.apk
ant release
jarsigner -verbose -keystore release-key.keystore bin/MainActivity-release-unsigned.apk android 
zipalign -v 4  bin/MainActivity-release-unsigned.apk  bin/mian-release.apk
adb install -r bin/mian-release.apk
