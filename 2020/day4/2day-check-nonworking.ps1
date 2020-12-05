$passports = get-content input

$passport = @{}

$valid = 0
$empty = 0
$bad = $false

function checkpassport($pp) {
    $pp.remove('cid')
    if ($pp.count -eq 7) { 
        $bad = $false
        foreach ($key in $pp.keys) {
            $value = $pp[$key]
             
            switch ($key) {
                byr { if (($value -lt 1920) -or ($value -gt 2002)) { write-host "Bad byr: $value"; return 0;}
            }
                iyr { if (($value -lt 2010) -or ($value -gt 2020)) { write-host "Bad iyr: $value"; return 0;}  
            }
                eyr { if (($value -lt 2020) -or ($value -gt 2030)) { write-host "Bad eyr: $value"; return 0;}  
            }
                hgt { 
                    if ($value -match '^(\d*)(cm|in)$') {
                        switch ($matches[2]) {
                            "cm" { 
                                if ($matches[1] -le 150 -or $matches[1] -ge 193) { 
                                    if (-not $bad) { $bad = $true; }
                                }
                            }
                            "in" {
                                if ($matches[1] -le 59 -or $matches[1] -ge 76) { 
                                    if (-not $bad) { $bad = $true; }
                                } 
                            }
                            default { $bad = $true; }
                        }
                    }
            }
                hcl { if ($value -match '^#[0-9|a-f]{6}$') {} else {write-host "Bad hcl: $value - line: $valid"; return 0;} 
            }
                ecl { switch ($value) {
                    amb {}
                    blu {}
                    brn {}
                    gry {}
                    grn {}
                    hzl {}
                    oth {}
                    default { write-host "Bad ecl: $value"; return 0; }
                    }}
                pid  { if ($value -match '^\d{9}$') {} else { write-host "Bad pid: $value"; return 0; } 
            }
                default { return 0; }
            }


        }
        if ($bad) { 
            return 0; 
        } else { return 1; }
    } else { write-host "Less than 7 fields"; return 0; }
}

        
        

foreach($line in $passports) {
    if ($line -eq "") { 
        $empty += 1
       # write-host "Empty Line" 
    
        $valid += checkpassport($passport)     

        $passport = @{}
    } else {
        $mash = $line.split(" ")
        foreach($passdata in $mash) {
            $k,$v = $passdata.split(":")
            $passport.Add($k,$v)
        }
    }
}

$valid += checkpassport($passport)     

#$passports | select-string '

write-host "Valid passports:   $valid"
write-host "Empty Lines: $empty"
