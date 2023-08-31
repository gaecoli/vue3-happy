const { defineConfig } = require('@vue/cli-service')

// 引入 element UI
const AutoImport = require('unplugin-auto-import/webpack')
const Components = require('unplugin-vue-components/webpack')
const { ElementPlusResolver } = require('unplugin-vue-components/resolvers')

module.exports = defineConfig({
    transpileDependencies: true,
    configureWebpack: {
        plugins: [
            AutoImport({
                resolvers: [ElementPlusResolver()],
            }),
            Components({
                resolvers: [ElementPlusResolver()],
            }),
        ],
    },
    devServer: {
        host: '0.0.0.0',
        // https:true,
        port: 6103,
        client: {
            webSocketURL: 'ws://0.0.0.0:6103/ws',
        },
        headers: {
            'Access-Control-Allow-Origin': '*',
        },
        proxy: {
            '/api': {
                target: 'http://localhost:6688',//http://localhost:9898/api
                ws: true,
                changeOrigin: true,
                pathRewrite:{
                    '^/api':''
                }
            },
        }
    },
    lintOnSave: false,
})