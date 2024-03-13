# Fracz Git Exercises

## master

    git verify

## commit-one-file
Add only one file and then commit

    git add A.txt
    git commit -S -m "commiting only A"
    git verify

## commit-one-file-staged
    
Here, we need to unstage the files. To do so, just do `git reset`  

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
        
And then merge

    git merge escaped
    git verify


## merge-conflict

    cat equaion.txt
        2 + ? = 5
    git checkout another-piece-of-work
        ? + 3 = 5
    git merge
    nvim equation
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

    git rebase hot-bugfix
    git verify


## remove-ignored

    git rm ignored.txt
    git commit -S -am "Removed ignored file"
    git verify


## case-sensitive-filename

Instead of unix `mv`, we need to use `git mv` here.

    git mv File.txt file.txt
    git commit -S -am "Renamed File.txt to file.txt"
    git verify


## fix-typo

    nvim file.txt
    A
        [backspace]x2 ld
    ESC :wq
    git commit -S -a --amend
    // FIX TYPO HERE AGAIN
    git verify


## forge-date

    // git commit --amend
    // changing the date here using vim-style text editing wont work!!
    // we need to 
    git commit --amend --date="1987-06-09"
        :wq
    git verify


## fix-old-typo

https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History#Changing-Multiple-Commit-Messages

https://www.baeldung.com/ops/git-modify-commit

I honestly don't know what I did, but this somehow works.

    git rebase -i HEAD^^
    // change pick to edit in the concerned commit
    git add file.txt
    git rebase --continue
    // fix merge conflict
    git add file.txt
    git rebase --continue
    git verify