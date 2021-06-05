param (
	[string]$o = "document.pdf"
)

$repo = "tyupch/Documentation.Automation.Pandoc"
$file = "template.pandoc.zip"
$releases = "https://api.github.com/repos/$repo/releases"

Write-Host Determining latest release
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tag = (Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name

$download = "https://github.com/$repo/releases/download/$tag/$file"
$name = $file.Split(".")[0]
$zip = "$name-$tag.zip"
$folder = "$name-$tag"

Write-Host Dowloading latest release
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $download -Out $zip

Write-Host Extracting release files
Expand-Archive $zip -Force
Remove-Item $zip -Force

$documentationInfo = "$folder/Documentation.info"
if (Test-Path $documentationInfo) 
{
  ren $documentationInfo Documentation.md
}
$templateFile = "$folder/template.tex"
if (Test-Path $templateFile) 
{
  ren $templateFile template.latex
}
$titlepage = "$folder/layout-title-background.pdf";
$page = "$folder/layout-background.pdf";
$template = "$folder/template"
pandoc (get-item -path "*.md").FullName -o $o --toc -N -V margin-top=40mm -V margin-left=20mm -V margin-right=20mm -V margin-bottom=30mm --template $template -V titlepage=true -V toc-own-page=true -V page-background=$page -V titlepage-background=$titlepage -V page-background-opacity=1 -V version=1.0.0 -V lang=de

Remove-Item $folder -Recurse -Force
