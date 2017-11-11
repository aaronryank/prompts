# [bare](bare.bash)

![bare.bash](images/bare.PNG)

    contains a green > for every command that executed successfully and a red > for every command that exited with a nonzeor exit code.

 - Call `reset_prompt` to reset the prompt to one green <code>&gt;</code>.

# [debian](debian.bash)

![debian.bash](images/debian.PNG)

    username@hostname:cwd$

# [git-prompt](git-prompt.bash)

![git-prompt.bash](images/git-prompt.PNG)

    git-repo@branch cwd (sha1 files-changed)
    $ 

# [simple-info](simple-info.bash)

![simple-info.bash](images/simple-info.PNG)

    exit-code time-24hr basename branch $ 

 - Set `$FULLCWD` to `1` to print the full directory name instead of the basename.

# [power](power.bash)

![power.bash](images/power.PNG)

    User[console] (date, time) directory
    shell-version$ 

 - Set `$FULLCWD` to `0` to print the basename instead of the full directory name.
