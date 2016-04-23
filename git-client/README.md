# Docker git client #

**Usage:**

Set up an alias:

`alias git='docker run -it --rm -u 1000:1000 -v ~/.ssh:/home/user/.ssh -v $(pwd):/home/user/git zburgermeiszter/git-client'`

Use it as a regular git:

`git clone git@github.com:vendor/repo.git`
