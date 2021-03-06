PowerShell.exe -windowstyle hidden {
Add-Type -AssemblyName Microsoft.VisualBasic
$sheet1 = [Microsoft.VisualBasic.Interaction]::InputBox('Enter sheet1 path', 'Sheet1', "")
Add-Type -AssemblyName Microsoft.VisualBasic
$sheet2 = [Microsoft.VisualBasic.Interaction]::InputBox('Enter sheet2 path', 'Sheet2', "")
$csv1 = Import-Csv -Path "$sheet1"
$csv2 = Import-Csv -Path "$sheet2"
$head = (Get-Content -Path $sheet1 | Select-Object -First 1) -split ","
Compare-Object $csv1 $csv2 -Property $head | Export-Csv Difference.csv -NoTypeInformation

$proc = Compare-Object $csv1 $csv2 -Property $head | Select-Object -Property $head
}