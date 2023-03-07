function Invoke-UpdateCargoPackage() {
    $outdated_pkgs = cargo install-update -l  | Select-String "Yes" | ForEach-Object {$($_ -split(" "))[0]}
    foreach ($i in $outdated_pkgs) {
        cargo install $i
    }
}
