// example to use in the https://github.com/rgl/jenkins-vagrant environment.
pipeline {
    agent {
        label 'unity'
    }
    stages {
        stage('Build') {
            steps {
                powershell '''
                    Set-StrictMode -Version Latest
                    $ErrorActionPreference = 'Stop'
                    $ProgressPreference = 'SilentlyContinue'
                    trap {
                        Write-Output "ERROR: $_"
                        Write-Output (($_.ScriptStackTrace -split '\\r?\\n') -replace '^(.*)$','ERROR: $1')
                        Write-Output (($_.Exception.ToString() -split '\\r?\\n') -replace '^(.*)$','ERROR EXCEPTION: $1')
                        Exit 1
                    }
                    &'C:/Program Files/Unity/Editor/Unity.exe' `
                        -batchmode `
                        -quit `
                        -logFile - `
                        -projectPath $PWD `
                        -buildWindows64Player "$PWD/Build/Cube.exe" `
                        | Out-String -Stream
                    if ($LASTEXITCODE) {
                        throw "Build failed with exit code $LASTEXITCODE"
                    }
                    Write-Output 'Compressing artifact...'
                    mkdir Artifacts -Force | Out-Null
                    Push-Location Build
                    Compress-Archive * Artifacts/Cube.zip
                    Pop-Location
                    '''
            }
        }
    }
    post {
        success {
            archiveArtifacts 'Artifacts/*'
        }
        always {
            step $class: 'Mailer',
                recipients: emailextrecipients([
                    culprits(),
                    requestor()
                ]),
                notifyEveryUnstableBuild: true,
                sendToIndividuals: false
        }
    }
}