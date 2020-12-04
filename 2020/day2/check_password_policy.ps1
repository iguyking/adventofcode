$indata = get-content input

$totalsuccess = 0

foreach($line in $indata) {
    $rule, $password = $line.split(":");
    $count, $checkchar = $rule.split(" ");
    [int]$min, [int]$max = $count.split("-");

#    "$min $max $checkchar $password"

    $chargroups = $password.toCharArray() | Group-object
    [int]$number = ($chargroups | where Name -eq $checkchar).Count

    if ( ($min -le $number) -and ($number -le $max) ) {
        $totalsuccess += 1 
#        write-host "$min $max $checkchar $password : $number"
    }
}

$totalsuccess
