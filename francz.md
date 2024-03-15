# Fracz Git Exercises

## master

The challenge just told us to run `./configure.sh` script and then do the following command. So we do the same.

    git verify

## commit-one-file
To add only one file and then commit, we just `git add` the file `A.txt` which only adds `A.txt` to the staging area and then we `git commit` 
`git verify` marks completion of this exercise.

    git add A.txt
    git commit -S -m "commiting only A"
    git verify

## commit-one-file-staged
    
Here, we need to unstage the files. To do so, just do `git reset`. Git reset unstages all the files we added to the staging using `git add`.

    git reset
    git add A.txt
    git commit -S -m "commiting only A"
    git verify

## ignore-them

We need to ignore files with extensions: `.o`, `.exe`, `.jar` and the directory `libraries`. 
To do so, just create a `.gitignore` file and use the wildcard `*` to exclude these things.

    nvim .gitignore
        i
            *.o
            *.exe
            *.jar
            libraries/
        ESC :wq
    git add .gitignore
    git commit -S -m "Added .gitignore"
    git verify


## chase-branch

Get the list of branches:

    git branch
        * chase-branch
          commit-one-file
          commit-one-file-staged
          escaped
          ignore-them
          master
        
And then merge. To merge the branches we just use the `git merge` command.

    git merge escaped
    git verify


## merge-conflict

First, lets see the contents of the files `equation.txt` which is causing merge conflicts.

    cat equaion.txt
        2 + ? = 5
    git checkout another-piece-of-work
        ? + 3 = 5
    git merge

A wild merge conflict appears, let's fix it manually.
Edit the file `equation.txt`, delete the lines which are causing the conflict and then rewrite the equation.

    nvim equation.txt
        5dd
        i 
            2 + 3 = 5
        ESC :wq
    git commit -S -m "Merged"
    git verify


## save-your-work

As mentioned in the hint, we can use `git stash` to save our current work in background and clean the working area

    git stash
    nvim bug.txt
        4
        dd
        :wq
    git commit -am "Fixed the bug"
    git stash pop
    nvim bug.txt
        G
        o
            Finally, finished it!
        ESC :wq
    git add bug.txt
    git commit -am "Finished"
    git verify


## change-branch-history

Git rebase is a very cool :) 
We just need to do a single command to rebase the branch hot-bugfix here.

    git rebase hot-bugfix
    git verify


## remove-ignored

To remove staged fils, `git rm` should be used instead of the standard `rm` command to remove files.

    git rm ignored.txt
    git commit -S -am "Removed ignored file"
    git verify


## case-sensitive-filename

Instead of unix `mv`, we need to use `git mv` here.

    git mv File.txt file.txt
    git commit -S -am "Renamed File.txt to file.txt"
    git verify


## fix-typo

`--amend` can be used to fix changes in the last commit.

    nvim file.txt
    A
        [backspace]x2 ld
    ESC :wq
    git commit -S -a --amend
    // FIX TYPO HERE AGAIN
    git verify


## forge-date

Here, we need to `--amend` with the `--date=""` attribute to *forge* the date of the commit.

    // git commit --amend
    // changing the date here using vim-style text editing wont work!!
    // we need to 
    git commit --amend --date="1987-06-09"
        :wq
    git verify


## fix-old-typo

https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History#Changing-Multiple-Commit-Messages

https://www.baeldung.com/ops/git-modify-commit

Here, we will use interactive rebasing to manually edit the commits and fix the typo. `git rebase -i HEAD~N` returns last N commits and `git rebase -i HEAD^^` lets us select what we want to do with each commit.

    git rebase -i HEAD^^

Here, we will have a file opened and we need to specify what we need to do. We can see a `Hello Wordl` commit, so we will change the `pick` option to `edit`

    git add file.txt
    git rebase --continue
    
A wild merge conflict appears! Manually edit and fix the `file.txt` and continue.

    git add file.txt
    git rebase --continue
    git verify