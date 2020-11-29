# GitBook

## Install GitBook CLI

Note: Gitbook CLI has been deprecated and no longer under development. It only works with NodeJS version v12.19.0. 

```
## install previous nodejs version v12.19.0
nvm install --lts=Erbium

## install gitbook cli

npm i -g gitbook-cli
```

## Patch gitbook issue

```
# need to edit and patch this file
node_modules/graceful-fs/polyfills.js

# comment the following lines
fs.stat = statFix(fs.stat)
fs.fstat = statFix(fs.fstat)
fs.lstat = statFix(fs.lstat)
```

### How to remove "Published with Gitbook"

Create a custom CSS style file:

```
styles/website.css
```

and add the following CSS class:

```
.gitbook-link {
  display: none !important;
}
```

then, edit book.json
```
{
  "styles": {
    "website": "styles/website.css"
  }
}
```
