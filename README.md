# Picture Stories and Info

## All the stuff

### Elm with Webpack and Yarn
- `elm-package.json` for elm packages
- `package.json` for node packages
- `yarn.lock` current versions of node packages
- `webpack.config.js` - build and compile config
- `src\` - the app source files

### Sites
- [Demo](http://katjam.github.io/elm-pic-story-site)

## Installation
- You will need `elm`, `node` and `yarn` follow the official install instructions if you don't have already
- Clone this repo
- `yarn` to install

## Development
- Add node packages with `yarn add [package]`
- Watch files and serve to `localhost:3000` with `yarn dev`

## Tests
We're using [elm-test](https://github.com/elm-community/elm-test/) for testing.
- `npm install -g elm-test` will install the test runner on your machine
- Run tests with `elm-test` from root of site
- Todo add to build process

## Code Style
We're using [elm-format](https://github.com/avh4/elm-format) to standardise formatting. The output of different versions of elm-format varies significantly, so please use version 0.6.1-alpha.
- `npm install -g elm-format@0.6.1-alpha`

## Deployment
- Build to `dist\` with `yarn build`
- Push `dist\*` to gh-pages branch
