# GitBook

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
