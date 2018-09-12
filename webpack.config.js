var path = require('path');

module.exports = {
  entry: {
    app: [
      './src/index.js'
    ]
  },

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js',
  },

  module: {
    rules: [
      {
        test: /\.(css|scss)$/,
        use: [
          'style-loader',
          'css-loader',
          'sass-loader',
          'postcss-loader',
        ]
      },
      {
        test:    /\.html$/,
        exclude: /node_modules/,
        loader:  'file-loader?name=[name].[ext]',
      },
      {
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: [
          {
            loader: 'elm-assets-loader',
            options: {
              module: 'Assets',
              tagger: 'AssetPath',
              package: 'neontribe/haven',
              localPath: function (url) {
                  return './assets/' + url;
              }
            }
          },
          'elm-webpack-loader?verbose=true&warn=true&debug=false',
        ],
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'url-loader?limit=10000&mimetype=application/font-woff',
      },
      {
          test: /\.(png|jpg|gif|svg|ico|ttf|eot)$/,
          loader: 'file-loader',
          options: {
              name: '[name].[ext]?[hash]'
          }
      },
    ],

    //noParse: /\.elm$/,
  },

  devServer: {
    inline: true,
    stats: { colors: true },
  },


};
