# How I manage my dot files

Following a thread I saw on [hacker news](https://news.ycombinator.com/item?id=11070797), I put all of my config files and scripts under git to make setting up a new system easier.

Since this setup is a litle bit different than a normal git setup, you need to un the alias `config` instead of `git`. Also, since the entire home directory is technically under version control, there's a few commands you should **not** run (e..g, `config status -u`) unless you want to traverse your entire home directory :)

# How to set up this repo up on an exisiting system

> Something usually goes wrong here. Good luck :)

1. Clone the git repo onto your computer and put your previous dot files into a temp directory.

   > You can rm the `separate-git` flag if you don't want to keep things under version control.

   `cd ~ && git clone --separate-git-dir=$HOME/.myconf git@github.com:TessHuelskamp/.myconf.git temp`

1. Copy the files you want from the temporary directory into your home directory.
  * E.g., `cp temp/.aliases ~/.aliases`
1. Make sure that this line (below) is sourced in your login scripts so git knows how to interact with your home direcotry.
   - `alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'`
   > **Note:** This line may already be in your `~/.aliases` file if you copied that over in an earlier step.
1. `source` the `~/.aliases` file to get the `config` command into your aliases.
1. Configure your `config` git directory **not** to show untracked files by default (in this case those untracked files would be the entirity of your home directory :) )
   `config config status.showUntrackedFiles no`
   > **Note:** You'll need to remember to add any new files to this setup (e.g., any new `~/bin/exes` or `~/.configs`) because git won't prompt you to do that.

# Note on the difference between bash_profile and zshrc

The latest mac update changed the default shell from bash to zsh. I switched over to zshrc as my main shell since I don't have a strong opinion between the two shells.

I moved all of the aliases from `~/.bash_profile` into `~/.aliases` and had both the `~/.bash_profile` and `~/.zshrc` file source that aliases file.

> **Note that this setup means that `~/.aliases` should be a terminal node in a `source` tree.** If you mess that up, speaking from experience :p , you'll create an infinite `source` loop that'll block you from logging into an interactive terminal shell :) (If you _do_ create a forever loop you can fix it by running `rm ~/.aliases` from a "New Command" window in `Terminal`)

# Other new system TODOs

- Terminal configurations
  - Option as a meta key
- Keyboard: CapsLock -> Esc
- `defaults write com.apple.screencapture location AN_EXISTING_DIR`
- Add some desktop pointers to frequenltly used locations
  - `ln -s ~/ScreenShots ~/Desktop`
  - > Also the Sandbox & Downloads & Dropbox
- brew
- Hot corner locks window
  - Put display to sleep
  - And then require password immediately after locking
