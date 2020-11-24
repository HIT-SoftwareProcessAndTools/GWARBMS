layui.define(function(exports) {
  exports('conf', {
    container: 'gwarbms',
    containerBody: 'gwarbms-body',
    v: '2.0',
    base: layui.cache.base,
    css: layui.cache.base + 'css/',
    views: layui.cache.base + 'views/',
    viewLoadBar: true,
    debug: layui.cache.debug,
    name: 'gwarbms',
    entry: '/index',
    engine: '',
    eventName: 'gwarbms-event',
    tableName: 'gwarbms',
    requestUrl: './'
  })
});
