$customsforms = (get-content input -raw) -split "\n\r"


$sum = 0

foreach ($group in $customsforms) {
    $sum += ($group -split "" | where { $_ -match "[a-z]"} | Select-object -unique).count
}

$p2sum = 0

foreach ($group in $customsforms) {
    $cleangroup = $group.split("`n") | where {$_ -ne ""} 
    $count = $cleangroup.count
    $grouped = $cleangroup.ToCharArray() | group-object
    $yup = $grouped | where { $_.count -eq $count } | where {$_.name -match "[a-z]" }
    $yes = 0 
    foreach ($i in $yup) { $yes++ } 
    write-host "Yes: $yes"
    $p2sum += $yes

}

write-host "Part 1:  Sum of all answers from all groups = $sum"
write-host "Part 2:  Sum of everyone that answered yes = $p2sum"
