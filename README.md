# Picture Stories and Info

## Site urls
- [Staging](https://neontribe.github.io/contemplating-action/)
- [Production](https://www.contemplatingaction.org.uk)


### Built with Elm, Webpack and Yarn
- `elm-package.json` for elm packages
- `package.json` for node packages
- `yarn.lock` current versions of node packages
- `webpack.config.js` - build and compile config
- `src\` - the app source files

## Installation
- You will need `elm`, `node` and `yarn` follow the official install instructions if you don't have already
- Clone this repo
- `yarn` to install

## Development
- Add node packages with `yarn add <package>` or `yarn add --dev <package>`
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

### To staging (github pages)
- Build to `dist\` with `yarn build`
- Push `dist\*` to gh-pages branch

### To Production (Heroku)
- You will need a Heroku account with appropriate permissions
- We're using the Heroku CLI(https://devcenter.heroku.com/articles/heroku-cli) for deploys. You will need to install it.
- First time: Login with `heroku login -i`
- First time: Add the Heroku remote to your local repo with `heroku git:remote -a contemplating-action`
- `git checkout <release-branch>`
- `git tag v<semantic version number>`
- `git push origin --tags`
- `git push heroku <release-branch>:master
- Todo automate on tagged release
