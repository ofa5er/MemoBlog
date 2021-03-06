---
title: Git CheatSheet
comments: true
date: 2017-03-02 21:25:12
tags:
 - git
 - cheatsheet
---
A list of Git commands and tips
<!-- more -->
# 50 characters or less
Vim ships with syntax, indent, and filetype plugins for Git commits which can help here.
Add this line to your `~/.vimrc` to add spell checking and automatic wrapping at the recommended 72 columns to you commit messages.
```
autocmd Filetype gitcommit setlocal spell textwidth=72
```
# Good ressources
- http://udacity.github.io/git-styleguide/ 
- https://victoria.dev/blog/git-commit-practices-your-future-self-will-thank-you-for/
- https://chris.beams.io/posts/git-commit/
# Remove Local Branch
```
git branch -d the_local_branch
```

# Push a new local branch to a remote Git repository
```
git checkout -b <sandbox/new_branch_name>
```
Edit file, add and commit then push
```
git push -u origin <sandbox/new_branch_name>
```
# Remember credentials
```
git config --global credential.helper "cache --timeout=3600"
```

# Add a submodule
```
git submodule add -b <branch> <git repo>
```
# Get submodule code
```
git submodule update --remote --init
```

# Remove Remote Branch
```
git push <remote_name> --delete <branch_name>
```

