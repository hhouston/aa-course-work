module.exports = {
  context: __dirname,
  entry: "./widgets.jsx",
  output: {
    path: "./",
    filename: "bundle.js"
  },
  devServer: {
    inline: true,
    Port: 8080
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: 'babel',
        query: {
          presets: ['react', 'es2015']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ["", ".js", ".jsx" ]
  }
};
