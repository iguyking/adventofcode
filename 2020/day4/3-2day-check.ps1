$fileinfo = (get-content input).replace(" ", "`n") -split("`n")

if ($fileinfo[-1] -ne "`n") { $fileinfo += "`n"}

$passport = @{}  #Store each passport info into a Hashtable
$passports = New-Object System.Collections.Generic.List[System.Object]

foreach ($line in $fileinfo) {
    
    if ([string]::IsNullorEmpty($line) -or $line -eq "`n") {
        $passports.Add($passport)
        $passport = @{}
    } else {
        $k,$v = $line.split(":")
        $passport.add($k, $v)
    }
}

$goodpart1 = 0
$goodpart2 = 0
$bad = $false

foreach ($p in $passports) { 
    $p.remove('cid')
    $bad = $false
    if ($p.count -ne 7) { $bad = $true }
    if (-not $bad) { $goodpart1 += 1 }
}

$bad = $false
foreach ($p in $passports) {
    $p.remove('cid')
    $bad = $false
    if ($p.count -ne 7) { $bad = $true } else {
        foreach ($key in $p.keys) {
            $value = $p[$key]
            switch ($key) {
                byr { if (-not (($value -ge 1920) -and ($value -le 2002))) { $bad = $true }  
                }
                iyr { if (-not (($value -ge 2010) -and ($value -le 2020))) { $bad = $true }  
                }
                eyr { if (-not (($value -ge 2020) -and ($value -le 2030))) { $bad = $true }  
                }
                hgt { 
                    if ($value -match '^(\d*)(cm|in)$') {
                        switch ($matches[2]) {
                            "cm" { if (-not (($matches[1] -ge 150) -and ($matches[1] -le 193))) { $bad = $true; }  }
                            "in" { if (-not (($matches[1] -ge 59) -and ($matches[1] -le 76))) {   $bad = $true; }  } 
                            default { $bad = $true; }
                        }
                    } else { $bad = $true }
                }
                hcl { if ($value -match '^#[0-9|a-f]{6}$') {} else {  $bad = $true } 
                }
                ecl { 
                    switch ($value) {
                        amb {}
                        blu {}
                        brn {}
                        gry {}
                        grn {}
                        hzl {}
                        oth {}
                        default { $bad = $true }
                    }
                }
                pid { if ($value -match '^\d{9}$') {} else { $bad = $true } 
                }
                default { $bad = $true }
            }
        }
    }
    if (-not $bad) { 
        $goodpart2 += 1
    }
}



#$passports

write-host "Total count: " $passports.Count
write-host "Part 1: $goodpart1"
write-host "Part 2: $goodpart2"

