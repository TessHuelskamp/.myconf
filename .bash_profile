
#add usr/local/bin if exists
if [[ -d "$HOME/bin" ]] ; then
    PATH="${PATH}:$HOME/bin"
fi

export PATH=/usr/local/opt/ruby/bin:$PATH

if [[ -f "~/.aliases" ]]; then
    source ~/.alises
fi



# Not sure if this is necessary still.
# This was in my .bash_profile when I pulled my config dir onto my laptop
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


