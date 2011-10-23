var rpc = {
    addPackage: function(pkg) {
        var array = pkg.split('.');
        var p;
        var me = this;
        $.each(array, function(i, a) {
            p = me.addSub(p, a);
        });
    },

    addSub: function(p, n) {
        p = p || this;
        p.path = p.path || '';
        p[n] = p[n] || {};
        p[n].path = p.path + '/' + n;
        return p[n];
    },

    addMethod: function(pkg, m) {
        var me = this, p;
        eval('p=this.' + pkg);
        if (typeof m == 'string') {
            p[m] = function(data, callback) {
                me.call(p.path + '/' + m + ".json", data, callback);
            }
        } else {
            $.each(m, function(i, a) {
                p[a] = function(data, callback) {
                    me.call(p.path + '/' + a + ".json", data, callback);
                }
            });
        }
    },

    call: function(url, data, callback) {
        if(typeof data == 'function') {
            callback = data;
            data = {};
        }
        $.post(url, data, callback);
    }
};
