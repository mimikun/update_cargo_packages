function update_cargo_packages --description 'Update cargo packages'
    set cargo_outdated_pkgs (cargo install-update -l | grep "Yes" | cut -d " " -f 1)
    for i in $cargo_outdated_pkgs
        cargo install "$i"
    end
end
