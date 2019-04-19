This is a simple Unity example that shows a cube.

You can move the cube around by using the arrow keys.

# Vagrant Environment

After a `vagrant up` you should have a VM with Unity installed. You still need to
[activate](https://docs.unity3d.com/Manual/LicensesAndActivation.html) it by
launching Unity Hub from the Desktop shortcut.

After Unity is activated, you can build `Build\Cube.exe` from the command line with:

```powershell
# build the project.
# NB this only succeeds after Unity is activated (when its
#    activated a C:\ProgramData\Unity\Unity_lic.ulf file exists).
# NB the scenes to be built must be declared inside the
#    ProjectSettings/EditorBuildSettings.asset file.
#    You can do this in Unity, by selecting the File | Build Settings
#    menu and clicking the "Add Open Scenes" button.
# see https://docs.unity3d.com/Manual/CommandLineArguments.html
&'C:\Program Files\Unity\Editor\Unity.exe' `
    -batchmode `
    -quit `
    -logFile - `
    -projectPath $PWD `
    -buildWindows64Player "$PWD\Build\Cube.exe" `
    | Out-String -Stream
if ($LASTEXITCODE) {
    throw "Build failed with exit code $LASTEXITCODE"
}
```

# Notes

* To use unity from a non-administrator account you need to grant it the `Remote Enable` permission to the `ROOT\CIMV2` WMI namespace. For example, to run from Jenkins see [rgl/jenkins-vagrant](https://github.com/rgl/jenkins-vagrant/blob/master/windows/provision-unity.ps1) for more details.
* To manage multiple Unity instances try to use one of:
  * https://github.com/DragonBox/u3d
  * https://github.com/Microsoft/unitysetup.powershell
