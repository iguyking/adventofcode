$passes = get-content input


function bsp {
    param($start, $end, $bottom, $top, $code)

    for($i=$start; $i -lt $end; $i++) {
    
        $mid = [int]($top + $bottom + 1) / 2
    
        $step = $code[$i]
        switch($step) {
            "F" { $top = $mid - 1 }
            "L" { $top = $mid - 1 }
            "B" { $bottom = $mid }
            "R" { $bottom = $mid }
        }
#        write-host "$step $bottom $top"
    }
#    write-host "function $start, $end, $bottom, $top, $code, $top"
    return $top
}

$allpasses = New-Object System.Collections.Generic.List[System.Object]

foreach ($boarding in $passes) {
    $row = bsp 0 7 0 127  $boarding
    $column = bsp 7 11 0 7  $boarding 
    $seatid = ($row*8) + $column
#    write-host "Final: $boarding $row $column $seatid"
    $allpasses.add($seatid)
}

$measure = $allpasses | measure -maximum -minimum

$allseats = $measure.minimum..$measure.maximum

$myseat = $allseats | ?{$allpasses -notcontains $_}

write-host "Day 5 Part 1: Highest Seat Number $($measure.maximum)"
write-host "Day 5 Part 2: My Seat Number $myseat"
