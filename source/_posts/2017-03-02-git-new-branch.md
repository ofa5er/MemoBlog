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
# Awsome commit message 
http://udacity.github.io/git-styleguide/ 

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
git submodule add -b 5.1 https://github.com/kamailio/kamailio
```
