# Picture Stories and Info

## Site URLs
- [Staging](https://neontribe.github.io/contemplating-action/)
- [Production](https://www.contemplatingaction.org.uk)

### Elm with Webpack and Yarn
- `elm.json` for elm packages
- `package.json` for node packages
- `yarn.lock` current versions of node packages
- `webpack.config.js` - build and compile config
- `src\` - the app source files

## Installation
- You will need `elm@0.19`, `node` and `yarn` follow the official install instructions if you don't have already
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
We're using [elm-format](https://github.com/avh4/elm-format) to standardise formatting.
The output of different versions of elm-format varies significantly, so please use version `0.8.1`.
- e.g. run over all src files `yarn format src` from the root of the site
- Todo add to commit or push

## Deployment

### To staging (GitHub pages) with Travis
We're using [Travis](https://travis-ci.org).
- On every push to the repo, Travis will build and run tests
- To trigger a deploy to gh-pages, create and push a tag (e.g. `git tag v1.0.0 && git push origin --tags`
Encrypted vars can be added to `.travis.yml` using the travis cli tools as decribed in the [travis docs](https://docs.travis-ci.com/user/encryption-keys/#usage).
Currently configured with GITHUB_TOKEN value.


### To Production (Heroku)
- You will need a Heroku account with appropriate permissions
- We're using the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) for deploys. You will need to install it.
- First time: Login with `heroku login -i`
- First time: Add the Heroku remote to your local repo with `heroku git:remote -a contemplating-action`
- `git checkout <release-branch>`
- `git tag v<semantic version number>`
- `git push origin --tags`
- `git push heroku <release-branch>:master
- Todo automate on tagged release
