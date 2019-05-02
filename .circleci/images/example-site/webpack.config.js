
const path = require('path')
const forgeConfig = require('./forge.config.js')

// Try the environment variable, otherwise use root
const ASSET_PATH = process.env.ASSET_PATH || '/';

let config = {
  entry: {
    main: path.resolve(forgeConfig.dirs.scripts, 'main.js')
  },
  output: {
    publicPath: ASSET_PATH,
    path: path.resolve(__dirname, path.join(forgeConfig.dirs.build, forgeConfig.dirs.scripts)),
    filename: '[name].js'
  }
}

module.exports = config
