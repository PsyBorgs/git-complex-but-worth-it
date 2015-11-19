# Installation

Install `git` from the [official website](https://git-scm.com).
See the [Pro Git book](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (online documentation) if you get stuck.

# `git` commands

## Basic commands

Create a git repository in the current directory:

    git init

Stage a file within your git directory (new or modified; nb. change `<filename>` to your file's name!):

    git add <filename>

Show the files changed:

    git status

Show changes in single file compared to last commit:

    git diff <filename>

Commit the local file changes that were staged:

    git commit <filename>

Show history of changes:

    git log

## Beyond the basics

Create a branch based on the current status of the present branch (nb. change `<branch_name>` to anything you want — perhaps `develop`):

    git branch <branch_name>

Switch to the branch you've just created:

    git checkout <branch_name>

**Bonus command:** Create a new branch and switch to it (with a single command; nb. the `-b`):

    git checkout -b <branch_name>
