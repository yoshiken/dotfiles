if test -f ~/.rvm/scripts/rvm; then
		    [ "$(type -t rvm)" = "function" ] || source ~/.rvm/scripts/rvm
			fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
