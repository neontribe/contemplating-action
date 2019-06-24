const path = require('path');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');


module.exports = {
  entry: {
    app: [
      './src/index.js'
    ]
  },

  mode: 'production',

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js',
  },

  plugins: [
    new CopyWebpackPlugin([
      { from: './src/assets', to: './'}
    ]),
    new HtmlWebpackPlugin({
      template: './src/index.html',
      inject: 'body',
      filename: 'index.html',
    }),
  ],

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
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: [
          {
            loader: 'elm-webpack-loader',
            options: {
              debug: false,
              optimize: true,
              verbose: false,
            }
          },
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

};
