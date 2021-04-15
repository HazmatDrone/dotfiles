# ZSH Theme - Preview: https://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

#host_colors=(red green yellow blue magenta cyan bg-red bg-green bg-yellow bg-blue bg-magenta bg-cyan)
#host_color=${host_colors[($((0x$(sha1sum <<<"$HOST"|cut -c1-6))) % ${#host_colors[@]})]}
#local user_host='%{$terminfo[bold]$fg[green]%}%n@$fg[${host_color}]%m %{$reset_color%}'

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
    local user_symbol='#'
elif [[ $SSH_CONNECTION ]]; then
    local user_host='%{$terminfo[bold]$fg[yellow]%}%n@%m %{$reset_color%}'
    local user_symbol='$'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}'
    local user_symbol='$'
fi

local git_branch='$(if [[ $(git_repo_name) && $(git rev-parse --show-toplevel) != $HOME ]]; then git_prompt_info; fi)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'
ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"
CHECK_LEN(){
	echo $(expr length "$(print -P "$@" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g")")
}

local P1_LONG="╭─${user_host}%{$terminfo[bold]$fg[blue]%}%~ %{$reset_color%}${rvm_ruby}${git_branch}${venv_prompt}"
local P1_SHORT="╭─${user_host}%{$terminfo[bold]$fg[blue]%}%1~ %{$reset_color%}${rvm_ruby}${git_branch}${venv_prompt}"
local P1_SHORTER="╭─%{$terminfo[bold]$fg[blue]%}%1~ %{$reset_color%}${rvm_ruby}${git_branch}${venv_prompt}"
local P1_EVENSHORTER="%{$terminfo[bold]$fg[blue]%}%-0>..>%1~ %{$reset_color%}"
local PROMPT_2="╰─%B${user_symbol}%b"

local PROMPT='$(
	if [[ $(CHECK_LEN $P1_LONG) -le $COLUMNS ]]; then
		print -P $P1_LONG;
	elif [[ $(CHECK_LEN $P1_SHORT) -le $COLUMNS ]]; then
		print -P $P1_SHORT;
	elif [[ $(CHECK_LEN $P1_SHORTER) -le $COLUMNS ]]; then
		print -P $P1_SHORTER;
	else
		print -P $P1_EVENSHORTER;
	fi
)
$PROMPT_2 '
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
