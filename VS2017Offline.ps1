<#
 VS2017Offline.ps1

 Quick script to download selected VS2017 configuration for offline install.

 Installer Name and available packages vary by VS edition.

 Download installer from: https://www.visualstudio.com/downloads/
 
 Full list of valid locales: https://docs.microsoft.com/en-us/visualstudio/install/install-vs-inconsistent-quality-network#list-of-language-locales
 
 Full details: https://docs.microsoft.com/en-us/visualstudio/install/install-vs-inconsistent-quality-network
#>

$installerExe = "C:\Temp\vs_Enterprise.exe";
$outputDirectory = "C:\temp\VS2017Offline\"
$includeOptionalPackages = true;
$language = "en-US"   

$packages = @( 
     "Microsoft.VisualStudio.Workload.CoreEditor"            # Visual Studio core editor
  # ,"Microsoft.VisualStudio.Workload.Azure"                 # Azure development
    ,"Microsoft.VisualStudio.Workload.Data"                  # Data storage and processing
  # ,"Microsoft.VisualStudio.Workload.DataScience"           # Data science and analytical applications
    ,"Microsoft.VisualStudio.Workload.ManagedDesktop"        # .NET desktop development
  # ,"Microsoft.VisualStudio.Workload.ManagedGame"           # Game development with Unity
  # ,"Microsoft.VisualStudio.Workload.NativeCrossPlat"       # Linux development with C++
  # ,"Microsoft.VisualStudio.Workload.NativeDesktop"         # Desktop development with C++
  # ,"Microsoft.VisualStudio.Workload.NativeGame"            # Game development with C++
  # ,"Microsoft.VisualStudio.Workload.NativeMobile"          # Mobile development with C++
    ,"Microsoft.VisualStudio.Workload.NetCoreTools"          # .NET Core cross-platform development
  # ,"Microsoft.VisualStudio.Workload.NetCrossPlat"          # Mobile development with .NET
    ,"Microsoft.VisualStudio.Workload.NetWeb"                # ASP.NET and web development
  # ,"Microsoft.VisualStudio.Workload.Node"                  # Node.js development
  # ,"Microsoft.VisualStudio.Workload.Office"                # Office/SharePoint development
  # ,"Microsoft.VisualStudio.Workload.Python"                # Python development
  # ,"Microsoft.VisualStudio.Workload.Universal"             # Universal Windows Platform development
  # ,"Microsoft.VisualStudio.Workload.VisualStudioExtension" # Microsoft.VisualStudio.Workload.VisualStudioExtension
  # ,"Microsoft.VisualStudio.Workload.WebCrossPlat"          # Mobile development with JavaScript
);

$selectedPackages = $packages | Foreach { " --add $_" };
$selectedOptionals = If ($includeOptionalPackages) {" --includeOptional "} Else {""}

$cmd = $installerExe + " --layout " + $outputDirectory + $selectedOptions + $selectionOptionals + " --lang "  + $language

Write-Host Executing Command: $cmd
Invoke-Expression $cmd;