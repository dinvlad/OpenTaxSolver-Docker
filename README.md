# OpenTaxSolver Docker

Provides [OpenTaxSolver](http://opentaxsolver.sourceforge.net) GUI in a Docker container.

Usage:

1.  Install [socat](https://linux.die.net/man/1/socat) and your favorite X11 server.
    For example, on macOS:
    ```
    brew install socat
    command -v Xquartz || brew cask install xquartz
    ```
2.  Run
    ```
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
    docker run --rm -it -e DISPLAY=host.docker.internal:0 -v $HOME/taxes:/taxes dinvlad/opentaxsolver
    ```

3.  Use `/taxes` folder to store your tax files from the UI.
    The files will appear in `$HOME/taxes` on your computer.
