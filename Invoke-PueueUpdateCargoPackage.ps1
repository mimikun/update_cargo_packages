function Invoke-PueueUpdateCargoPackage() {
    $outdated_pkgs = cargo install-update -l  | Select-String "Yes" | ForEach-Object {$($_ -split(" "))[0]}
    foreach ($i in $outdated_pkgs) {
        pueue add -- "cargo install $i"
    }
}

Set-Alias -Name pueue_update_cargo_package -Value Invoke-PueueUpdateCargoPackage
