# Picture Stories and Info

## All the stuff

### Elm with Webpack and Yarn
- `elm-package.json` for elm packages
- `package.json` for node packages
- `yarn.lock` current versions of node packages
- `webpack.config.js` - build and compile config
- `src\` - the app source files

### Sites
- [Demo](https://neontribe.github.io/contemplating-action/)

## Installation
- You will need `elm`, `node` and `yarn` follow the official install instructions if you don't have already
- Clone this repo
- `yarn` to install

## Development
- Add node packages with `yarn add [package]`
- Watch files and serve to `localhost:3000` with `yarn dev`

## Tests
We're using [elm-test](https://github.com/rtfeldman/node-test-runner/releases/tag/0.18.12) for testing.
- Run tests with `yarn test` from root of site
- Todo add to build process

## Code Style
We're using [elm-format](https://github.com/avh4/elm-format) to standardise formatting. The output of different versions of elm-format varies significantly, so please use version 0.6.1-alpha.
- e.g. run over all src files `yarn format src` from the root of the site
- Todo add to commit or push

## Deployment
- Build to `dist\` with `yarn build`
- Push `dist\*` to gh-pages branch

## Copy Documents
- [Flow Copy] (https://docs.google.com/document/d/1E8rn_y2SWBOJQJzgICyCFYpCxgJPH_7Z4B1YOcsmWB8/edit)
