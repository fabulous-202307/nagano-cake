const { environment } = require('@rails/webpacker')

module.exports = environment
<<<<<<< HEAD
=======

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
  })
)
>>>>>>> a2217da48f0773abb2441c17c70de76c0d299cb8
