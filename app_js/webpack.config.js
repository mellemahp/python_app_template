var path = require('path');

module.exports = {
    entry : './client/index.js',
    output : {
        path : path.resolve(__dirname , 'dist'),
        filename: 'index_bundle.js'
    },
    module : {
        rules : [
            {test : /\.(js)$/, use:'babel-loader'},
            {test : /\.css$/, use:['style-loader', 'css-loader']}
        ]
    },
    devServer: {
        contentBase: path.join(__dirname, '.'),
        publicPath: '/dist/',
        watchContentBase: true,
        host: '0.0.0.0',
        port: 80,
        proxy: {
            '!(/dist/**/**.*)': {
                target: 'http://127.0.0.1:5000',
            },
        },
    },
    mode:'development',
}