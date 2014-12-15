class people::boskya {
    $home = "/Users/${::boxen_user}"

    # development
    include atom

    # terminal
    include apps::fishShell
    include iterm2::dev

    file {
        "${home}/.config/fish/personal.fish":
            ensure  => link,
            target  => "${$boxen::config::repodir}/modules/people/files/boskya/personal.fish",
            subscribe => File["${home}/.config/fish/"]
    }

    file {
        "${home}/.bash_profile":
            ensure  => link,
            target  => "${$boxen::config::repodir}/modules/people/files/boskya/.bash_profile"
    }

    # browsers
    include chrome
    include chrome::canary
    include firefox

    # home media
    include chromecast
    include sonos

    # osx
    include spectacle

    include osx::global::enable_keyboard_control_access
    include osx::finder::show_hidden_files

    # configurations
    git::config::global {
        'user.email': value  => 'bosky.atlani@gmail.com'
    }

    git::config::global {
        'user.name': value  => 'boskya'
    }

    # atom
    atom::theme { 'seti-ui': }
    atom::theme { 'seti-syntax': }
    atom::package { 'linter': }
    atom::package { 'linter-jshint': }
}