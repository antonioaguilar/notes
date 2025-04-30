# Git commands and scripts

### Display all author and commit emails address in all branches

```bash

# show hash, author email, commit email
git log --all --pretty="%h %aE %cE"

# list only commit email
git log --all --pretty="%cE"
```

### Remove sensitive information, update email addresses in commits

```bash
# install git-filter-repo (MacOS)
brew install git-filter-repo

# create a file details.txt with the following:
Antonio Aguilar <antonioaguilar@users.noreply.github.com> Antonio Aguilar <sensitive-email@example.com>

# checkout repo and use git filter-repo plugin to modify all commits
# Note: 'origin' remote will be removed to prevent errors
git filter-repo --mailmap ~/details.txt

# re-create and push back origin
git remote add origin $ORIGINAL-GIT-REPO-URL

# perform a force push for all branches and tags
git push --force --branches --prune
git push --force --tags --prune

# run git log and check if the user/email changes are updated
```

### Pre-configured `.gitconfig` file

> Install `git-delta` plugin for better `git diff` via Homebrew `brew install git-delta`

```
[user]
  name = Antonio Aguilar
  email = antonioaguilar@users.noreply.gitlab.com

[push]
  default = current

[core]
  editor = nano
  pager = delta

[pull]
  rebase = false

[alias]
  ll = log --pretty=format:'%C(red)[%h] %C(bold blue)%an %C(reset)| %C(magenta)%ah %C(green)(%cr) %C(reset)| %C(yellow)%s' --numstat
  reset = reset --hard HEAD

[interactive]
  diffFilter = delta --color-only

[delta]
  side-by-side = true
  line-numbers = true
  navigate = true
  light = false

[merge]
  conflictstyle = diff3

[diff]
  colorMoved = default
```

### Use the `cat` command with syntax highlight

```bash
brew install bat

# create an alias for cat
alias cat='echo -e "" && bat -p'
```

### Enable local and remote branch push

```
git config push.default current
```

### Delete a local and remote branch

```
# delete the remote branch
git push origin --delete <branch-name>

# delete the local branch
git branch -D <branch-name>
```

### Change or fix previous commit messages (including author)

The first step is to identify the last "good" commit and provide its hash to the rebase command:

```
git rebase -i -p <commit-id>
```

Your default editor will open, requesting you to mark all the commits you want to change with the "edit" keyword. Git will now walk you through each commit, giving you the chance modify previous commits.

You can amend the commit now, with:

```
git commit --amend
```

Once you are satisfied with your changes, run:

```
git rebase --continue
```

You can now correct the author information and then continue to the next concerned commit object until you've edited all the commits you just marked:

```
git commit --amend --author="Antonio Aguilar <antonio@aguilar.org>" --no-edit

git rebase --continue
```

### Securely transfer a git repo

```
# create the git bundle
git bundle create repo.bundle -b master

# encrypt the repo with password
openssl enc -blowfish -a -in repo.bundle -out output.txt

# decrypt the repo
openssl enc -d -blowfish -a -in output.txt -out repo.bundle

# unbundle the repo
git clone repo.bundle -b master
```

### Bundle a repo

```
# bundle the develop branch
git bundle create repo.bundle -b develop
```

```
# to unbundle the repo
git clone repo.bundle -b develop
```

### Store user credentails

```
git config credential.helper store
```

in Mac OS:

```
git config --global credential.helper osxkeychain
```

### Reset branch changes

```
git reset --hard HEAD
```
