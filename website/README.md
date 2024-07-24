# OutCloud Documentation Website

This is a website for internal documentation, it is built using [Docusaurus 2](https://docusaurus.io/).

## 1. Development and Customization

### Development

Run a local development server and see live changes to site:

```
$ npm start
```

### Documentation

Create a standalone page:

- Add 'example.md' under 'src/pages' 

Create a page accessible in sidebar:

- Add 'example.md' under 'docs/' 

To create a collection of docs accessible in sidebar:

- add 'example.md' under 'docs/example/'


### Customization

- Edit basic [site settings](https://docusaurus.io/docs/configuration) in 'docusaurus.config.js'

- [Additional information](https://docusaurus.io/docs/category/guides) on how to customize website


### Build

Build the website:

```
$ npm build
```

### Deployment

Site is stored in an S3 and served by Cloudfront.
Deployment will be automated using GitHub Actions.

### Future Features

- Authentication and Authorization
- PDF support