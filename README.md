This is a simple Unity example that shows a cube.

You can move the cube around by using the arrow keys.

# Vagrant Environment

After a `vagrant up` you should have a VM with Unity installed. You still need to
activate it by launching Unity from the Desktop shortcut.

After Unity is activated, you can build `Cube.exe` from the command line with:

```powershell
# build the project.
# NB this only succeeds after Unity is activated (when its
#    activated a C:\ProgramData\Unity\Unity_lic.ulf file exists).
# NB the scenes to be built must be declared inside the
#    ProjectSettings/EditorBuildSettings.asset file.
#    You can do this in Unity, by selecting the File | Build Settings
#    menu and clicking the "Add Open Scenes" button.
# see https://docs.unity3d.com/Manual/CommandLineArguments.html
u3d run -- `
    -batchmode `
    -quit `
    -logFile Temp\build.log `
    -buildWindows64Player "$PWD\Build\Cube.exe"
if ($LASTEXITCODE) {
    Write-Output 'Build Failed. build.log:'
    Get-Content Temp\build.log
}
```
