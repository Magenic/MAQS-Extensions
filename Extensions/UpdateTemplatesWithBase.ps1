<#
.SYNOPSIS
    Zips the MAQS project templates.
.DESCRIPTION
    This powershell script is used to update the core and framework templates from the base content.  
    This way we can just update base content and not core and framework seperately.
.NOTES
  Version:        1.0
  Author:         Magenic
  Creation Date:  05/10/2021
  Purpose/Change: Initial script development. 
#>

Function UpdateCore {
    Param ($source, $dest)
    $source = $source +"\*"
    Copy-Item -Path $source -Destination $dest -Recurse -force
    Get-ChildItem -Path $dest -Filter App.config -Recurse | Remove-Item -Force
 }

 Function UpdateCoreStudio {
    Param ($source, $dest)
    UpdateCore $source $dest

    $testsFiles = $dest + "\Tests\*\"  
    Get-ChildItem -Path $testsFiles -Include *.cs -Recurse | ForEach-Object {

    $find = 'namespace Tests'
    $replace = 'namespace $safeprojectname$'

    (Get-Content -Path $_.FullName) -replace $find, $replace | Set-Content -Path $_.FullName
   }
 }

 Function UpdateFrameworkStudio {
        Param ($source, $dest)

    $source = $source +"\*"
    Copy-Item -Path $source -Destination $dest -Recurse -force
    Get-ChildItem -Path $dest -Filter appsettings.json -Recurse | Remove-Item -Force

    $testsFiles = $dest + "\Tests\*\"  
    Get-ChildItem -Path $testsFiles -Include *.cs -Recurse | ForEach-Object {
        $find = 'namespace Tests'
        $replace = 'namespace $safeprojectname$'

        (Get-Content -Path $_.FullName) -replace $find, $replace | Set-Content -Path $_.FullName
    }

    Get-ChildItem -Path $dest -Include *.csproj -Recurse | ForEach-Object {
        $findVer = 'netcoreapp3.1'
        $replaceVer = 'net471'

        $findConfig = 'appsettings.json'
        $replaceConfig = 'App.config'

        (Get-Content -Path $_.FullName) -replace $findVer, $replaceVer | Set-Content -Path $_.FullName
        (Get-Content -Path $_.FullName) -replace $findConfig, $replaceConfig | Set-Content -Path $_.FullName
    }
 }

 UpdateCoreStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Appium.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test Core\QATAppiumTemplate"
 UpdateFrameworkStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Appium.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test\QATAppiumTemplate"
 UpdateCore $PSScriptRoot"\BaseContent\Magenic.Maqs.Appium.Template" $PSScriptRoot"\CoreTemplates\Magenic.Maqs.Appium.Template"


 UpdateCoreStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Base.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test Core\QATBaseTemplate"
 UpdateFrameworkStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Base.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test\QATBaseTemplate"
 UpdateCore $PSScriptRoot"\BaseContent\Magenic.Maqs.Base.Template" $PSScriptRoot"\CoreTemplates\Magenic.Maqs.Base.Template"

 UpdateCoreStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Composite.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test Core\QATCompositeTemplate"
 UpdateFrameworkStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Composite.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test\QATCompositeTemplate"
 UpdateCore $PSScriptRoot"\BaseContent\Magenic.Maqs.Composite.Template" $PSScriptRoot"\CoreTemplates\Magenic.Maqs.Composite.Template"

 UpdateCoreStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Database.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test Core\QATDatabaseTemplate"
 UpdateFrameworkStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Database.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test\QATDatabaseTemplate"
 UpdateCore $PSScriptRoot"\BaseContent\Magenic.Maqs.Database.Template" $PSScriptRoot"\CoreTemplates\Magenic.Maqs.Database.Template"

 UpdateCoreStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Email.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test Core\QATEmailTemplate"
 UpdateFrameworkStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Email.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test\QATEmailTemplate"
 UpdateCore $PSScriptRoot"\BaseContent\Magenic.Maqs.Email.Template" $PSScriptRoot"\CoreTemplates\Magenic.Maqs.Email.Template"

 UpdateCoreStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Selenium.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test Core\QATSeleniumTemplate"
 UpdateFrameworkStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Selenium.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test\QATSeleniumTemplate"
 UpdateCore $PSScriptRoot"\BaseContent\Magenic.Maqs.Selenium.Template" $PSScriptRoot"\CoreTemplates\Magenic.Maqs.Selenium.Template"
 
 UpdateCoreStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Webservice.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test Core\QATWebserviceTemplate"
 UpdateFrameworkStudio $PSScriptRoot"\BaseContent\Magenic.Maqs.Webservice.Template" $PSScriptRoot"\VisualStudioQatExtensionOss\ProjectTemplates\Magenic Test\QATWebserviceTemplate"
 UpdateCore $PSScriptRoot"\BaseContent\Magenic.Maqs.Webservice.Template" $PSScriptRoot"\CoreTemplates\Magenic.Maqs.Webservice.Template"
