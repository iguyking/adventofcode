$customsforms = (get-content input -raw) -split "\n\r"


$sum = 0

foreach ($group in $customsforms) {
    $sum += ($group -split "" | where { $_ -match "[a-z]"} | Select-object -unique).count
}

write-host "Part 1:  Sum of all answers from all groups = $sum"
