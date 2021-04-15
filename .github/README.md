# Dotfiles
My dotfiles. Mostly concerned with making `zsh` and `tmux` pretty and useable, might also touch a few other things. These are obviously changed by me at my whims so I would recommend forking rather than cloning if you're not me.

### A quick summary:
* `.zshrc` autostarts tmux when I open a terminal session, and `.profile` sets my env vars and aliases
* oh-my-zsh, for making zsh more fun and interesting, with a few of its builtin plugins enabled as well as a few custom ones
* `bira-custom`, derivative of Bira's theme for oh-my-zsh, adds a few features such as changing colour to indicate connection over SSH, and doing its best to shorten the current dir if it would cause the prompt to wrap.
* custom `.nanorc` that mostly just turns all of the cool features on, enables syntax highlighting, and makes a few keybinds more intuitive
* Where do I even start with tmux... Honestly, I do so much to it and it changes so regularly that it's probably easier for you to just go through my `.tmux.conf` yourself. but tl;dr, I've:
	* Made a lot of the keys more intuitive
	* Recoloured everything
	* Turned on some features that are disabled by default, like mouse mode
	* Completely riced the status bar with a CPU and RAM readout and a little indicator for when you've just pressed `^A`
	* Set it up to work with the system clipboard 'proprely' in copy mode
	* Fixed scrolling in less/man (you can add any other applications you need to to the list!)
* `.XCompose` just adds some Greek symbols to my compose key: `α`, `β`, `γ`, `π`, `θ`, `Ω`, `ω`, all useful for math and engineering.
If you plan on using my dotfiles I'd highly recommend ripping them to pieces and using the pieces you find most relevant to you. Better learning curve that way.

# Rice Resources
Below you'll find some resources I've compiled for further reading. Both for myself if I need to reference documentation and for anyone else who might need some guidance.
## tmux
* The most comprehensive document by far for learning tmux is its manpage. Finding really good information online about it is honestly kinda hard; it's usually easier to just browse through man until you find what you're looking for
* For installing plugins to tmux, [tpm](https://github.com/tmux-plugins/tpm) is by far the most used resource.
* [Very basic cheatsheet](https://tmuxcheatsheet.com/)
* Look into: [wemux](https://github.com/zolrath/wemux)
#### Hacky Shared Screens
```
script -f /path/to/some/file # Writes terminal to file
tail -f /path/to/some/file # Reads terminal from file
```
Combine the two to get 'shared' screens on tmux where only one person can read/write
## nano
* [nano-editor.org](https://www.nano-editor.org/) contains all there really is to know about nano's customization options.
* [Cheatsheet](https://www.nano-editor.org/dist/latest/nanorc.5.html)
## zsh
* [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) is really great for making zsh much more functional, installing plugins, themes, etc etc etc. See my `.zshrc` for how to initialise it and `.zsh_install_plugins.sh` if you'd like to have it installed systemwide sometimes rather than in your homedir. However, it'll do a good job at helping you setup.
* [oh-my-zsh themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
* `man zshmisc` contains a lot of information for setting up custom prompts if you really want to get into that.
### Terminal Colours
| Color                        | Foreground | Background  |
|  --------------------------- | ---------- |------------ |
| Black                        | `\033[30m` | `\033[40m`  |
| Red                          | `\033[31m` | `\033[41m`  |
| Green                        | `\033[32m` | `\033[42m`  |
| Orange                       | `\033[33m` | `\033[43m`  |
| Blue                         | `\033[34m` | `\033[44m`  |
| Magenta                      | `\033[35m` | `\033[45m`  |
| Cyan                         | `\033[36m` | `\033[46m`  |
| Light gray                   | `\033[37m` | `\033[47m`  |
| Fallback to distro's default | `\033[39m` | `\033[49m`  |
| Dark gray                    |           	| `\033[100m` |
| Light red                    |           	| `\033[101m` |
| Light green 	               |            | `\033[102m` |
| Yellow                       |          	| `\033[103m` |
| Light blue 	                 |            | `\033[104m` |
| Light purple                 |          	| `\033[105m` |
| Teal                         |          	| `\033[106m` |
| White                        |          	| `\033[107m` |
