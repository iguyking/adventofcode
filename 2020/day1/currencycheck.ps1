$input = get-content input

foreach($line1 in $input) {
    foreach($line2 in $input) {
        foreach($line3 in $input) {

            $sum = [int]$line2 + [int]$line1 + [int]$line3
#        "  Sum: $sum"
            if ($sum -eq 2020) { 
                $multi = [int]$line2 * [int]$line1 * [int]$line3
                "Match Found $line2 & $line1 & $line3 :  Multiple: $multi"
            }
        }
    }
}
