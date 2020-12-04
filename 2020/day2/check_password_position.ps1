$indata = get-content input

$totalsuccess = 0

foreach($line in $indata) {
    $rule, $password = $line.split(":");
    $count, $checkchar = $rule.split(" ");
    [int]$min, [int]$max = $count.split("-");

#    "$min $max $checkchar $password"

    if ( ($password[$min] -eq $checkchar) -and ($password[$max] -ne $checkchar) ) {
        $totalsuccess += 1 
    }
    if ( ($password[$min] -ne $checkchar) -and ($password[$max] -eq $checkchar) ) {
        $totalsuccess += 1 
    }
}

write-host $totalsuccess 
