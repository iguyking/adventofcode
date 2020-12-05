$boarding = "BBFFBBFRLL"



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
        write-host "$step $bottom $top"
    }
    write-host "function $start, $end, $bottom, $top, $code, $top"
    return $top
}

$row = bsp 0 7 0 127  $boarding
$column = bsp 7 11 0 7  $boarding 
$seatid = ($row*8) + $column
write-host "Final: $row $column $seatid"

$top = 127
$bottom = 0 
    for($i=0; $i -lt 7; $i++) {
    
        $mid = [int]($top + $bottom + 1) / 2
    
        $step = $boarding[$i]
        switch($step) {
            "F" { $top = $mid - 1 }
            "B" { $bottom = $mid }
        }
        write-host "$step $bottom $top"
    }


$row = $top

$top = 7
$bottom = 0

for($j=7; $j -lt 11; $j++) {

    $mid = [int]($top + $bottom + 1) / 2

    $step = $boarding[$j]
    switch($step) {
        "L" { $top = $mid - 1 }
        "R" { $bottom = $mid }
    }
    write-host "$step $bottom $top"
}

$column = $top
$seatid = ($row*8) + $column
write-host "Final: $row $column $seatid"
