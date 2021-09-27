### Github workflow  

We will spend time in class on the following:  
1) forking a repo (this makes a copy in your GitHub account, which you can modify)  

We will fork the Apache Spark repo, which lives here:  
https://github.com/apache/spark

2) cloning the forked repo to local machine (this copies the fork to your local)
3) creating a new file locally and adding to version control (git add, git commit)
4) push the file back to GitHub (git push)
5) discuss how to get repo updates with git pull

---  

**Committing Files**  

First, to accomplish steps 3-5, it's preferable to use the command line.  
You'll want to open a terminal (in Windows, PowerShell is a good option).  
Let > denote the command prompt in terminal.

When you are ready to stage a file called file.txt for commit, enter:

`> git add file.txt`

Note that multiple files can be staged.  
When you are ready to commit your file(s), enter:  

`> git commit -m 'a message to describe what you are committing'`

where `-m` denotes a message flag; the message must be in single quotes

The committed files will now be tracked by `git`.

To push the file back to GitHub, enter:

`git push`

Note this will push the commit to the repo that you cloned.  
You should be able to now see the commit in the GitHub repo.  

---    

**Syncing your Fork to the Original Repo and Pulling Changes with `git pull`**

When you want to sync your repo to the original repo, follow these steps:
1) From the forked repo in your GitHub account, click Fetch upstream at the top right of the page.  
   This syncs the fork with the original.

2) Open terminal, change directory to your repo, and run:  

`> git pull origin`

or more simply:

`> git pull`  
   
--- 

**How can you pull from the original repo?**  

First we briefly list all steps, and then explain details.  

```
> git remote add upstream https://github.com/apache/spark.git
> git fetch upstream
> git merge upstream/main main
```

**Details:**  

1) Add the original repo (the one you forked) as a remote.

`> git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git`  

Specifically for this example the command is:  

`> git remote add upstream https://github.com/apache/spark.git`  

You can check that this upstream repo has been added with:  

`> git remote -v`

This will show:  
origin  https://github.com/James/spark.git (fetch)  
origin  https://github.com/James/spark.git (push)  
upstream        https://github.com/apache/spark.git (fetch)  
upstream        https://github.com/apache/spark.git (push)  

This indicates that the repo on your machine is linked to the forked copy,
and that the original copy is upstream.

2) Fetch the updates

`> git fetch upstream`

3) Lastly, merge the updates:  

`> git merge upstream/main main`

If the merge fails, you likely altered your repo. Git will give suggestions on how to fix a merge conflict.

**Notes:** 
- the fetch + merge steps are equal to git pull, but the former is safer as a fetch will succeed in the event of a merge conflict
- every repo has a `main` branch which is intended to be the active branch. developers can work on separate branches, and attempt to merge
  tested, useful code to the main branch.
