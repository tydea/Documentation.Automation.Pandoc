param (
	[string]$o = "document.pdf"
)
$documentationInfo = "Documentation.info"
if (Test-Path $documentationInfo) 
{
  ren $documentationInfo Documentation.md
}
$templateFile = "template.tex"
if (Test-Path $templateFile) 
{
  ren template.tex template.latex
}
pandoc (get-item -path "*.md").FullName -o $o --toc -N -V margin-top=40mm -V margin-left=20mm -V margin-right=20mm -V margin-bottom=30mm --template template -V titlepage=true -V toc-own-page=true -V page-background="layout-background.pdf" -V titlepage-background="layout-title-background.pdf" -V page-background-opacity=1 -V version=1.0.0 -V lang=de