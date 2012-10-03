// Created by Jonathan Eatherly, (https://github.com/joneath)
// MIT license
// Version 1.0.1

(function(jasmineAjax) {
    var self = jasmineAjax;
    var mocks;

    // Object.keys shim
    if (!Object.keys) {
        Object.keys = (function () {
            var hasOwnProperty = Object.prototype.hasOwnProperty,
                hasDontEnumBug = !({toString: null}).propertyIsEnumerable('toString'),
                dontEnums = [
                    'toString',
                    'toLocaleString',
                    'valueOf',
                    'hasOwnProperty',
                    'isPrototypeOf',
                    'propertyIsEnumerable',
                    'constructor'
                ],
                dontEnumsLength = dontEnums.length;

            return function (obj) {
                if (typeof obj !== 'object' && typeof obj !== 'function' || obj === null) throw new TypeError('Object.keys called on non-object');

                var result = [];

                for (var prop in obj) {
                    if (hasOwnProperty.call(obj, prop)) result.push(prop);
                }

                if (hasDontEnumBug) {
                    for (var i=0; i < dontEnumsLength; i++) {
                        if (hasOwnProperty.call(obj, dontEnums[i])) result.push(dontEnums[i]);
                    }
                }
                return result;
            };
        })();
    }

    // jQuery URL Parser plugin (No jQuery version!) - https://github.com/allmarkedup/jQuery-URL-Parser/tree/no-jquery
    // Written by Mark Perkins, mark@allmarkedup.com
    // License: http://unlicense.org/ (i.e. do what you want with it!)

    var purl=function(c){function g(d,c){for(var a=decodeURI(d),a=h[c?"strict":"loose"].exec(a),b={attr:{},param:{},seg:{}},e=14;e--;)b.attr[i[e]]=a[e]||"";b.param.query={};b.param.fragment={};b.attr.query.replace(j,function(a,c,d){c&&(b.param.query[c]=d)});b.attr.fragment.replace(k,function(a,c,d){c&&(b.param.fragment[c]=d)});b.seg.path=b.attr.path.replace(/^\/+|\/+$/g,"").split("/");b.seg.fragment=b.attr.fragment.replace(/^\/+|\/+$/g,"").split("/");b.attr.base=b.attr.host?b.attr.protocol+"://"+b.attr.host+
        (b.attr.port?":"+b.attr.port:""):"";return b}var i="source,protocol,authority,userInfo,user,password,host,port,relative,path,directory,file,query,fragment".split(","),l={anchor:"fragment"},h={strict:/^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,loose:/^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/},
        j=/(?:^|&|;)([^&=;]*)=?([^&;]*)/g,k=/(?:^|&|;)([^&=;]*)=?([^&;]*)/g;return function(d,f){1===arguments.length&&!0===d&&(f=!0,d=c);d=d||window.location.toString();return{data:g(d,f||!1),attr:function(a){a=l[a]||a;return a!==c?this.data.attr[a]:this.data.attr},param:function(a){return a!==c?this.data.param.query[a]:this.data.param.query},fparam:function(a){return a!==c?this.data.param.fragment[a]:this.data.param.fragment},segment:function(a){if(a===c)return this.data.seg.path;a=0>a?this.data.seg.path.length+
        a:a-1;return this.data.seg.path[a]},fsegment:function(a){if(a===c)return this.data.seg.fragment;a=0>a?this.data.seg.fragment.length+a:a-1;return this.data.seg.fragment[a]}}}}();

    beforeEach(function() {
        mocks = { };
        this.addMatchers({
            toHaveBeenRequested: function(expected) {
                if (this.actual && this.actual.requested) {
                    return true;
                } else {
                    return false;
                }
            }
        });
    });

    var requestNotFound = function(request) {
        return "Request not found, Request: " + request.action + " " + request.url;
    };

    var objValues = function(obj) {
        var keys = Object.keys(obj),
            vals = [];

        for(var i = 0; i < keys.length; i++) {
            vals.push(obj[keys[i]]);
        }
        return vals;
    };

    var matchParams = function(expectedUrl, requestUrl) {
        var expectedKeys = Object.keys(expectedUrl.param()),
            expectedValues = objValues(expectedUrl.param()),
            requestKeys = Object.keys(requestUrl.param()),
            requestValues = objValues(requestUrl.param());

        if (expectedKeys.length == requestKeys.length) {
            for(var i = 0; i < expectedKeys.length; i++) {
                if (expectedKeys.indexOf(requestKeys[i]) < 0 || expectedValues.indexOf(requestValues[i]) < 0) {
                    return false;
                }
            }
            return true;
        }

        return false;
    };

    var findRequest = function(action, url) {
        var requestUrl,
            requestPath,
            expectedUrl,
            expectedPath;
        for(var i = 0; i < ajaxRequests.length; i++) {
            requestUrl = purl(ajaxRequests[i].url);
            expectedUrl = purl(url);
            requestPath = requestUrl.attr("protocol") + "://" + requestUrl.attr("host") + requestUrl.attr("path");
            expectedPath = expectedUrl.attr("protocol") + "://" + expectedUrl.attr("host") + expectedUrl.attr("path");

            if (ajaxRequests[i].method === action && requestPath === expectedPath && matchParams(expectedUrl, requestUrl)) {
                return ajaxRequests[i];
            }
        }
    };

    var buildResponse = function(data) {
        var response = { };
        data = data || { };
        response.status = data.status || 200;
        response.responseText = data.body || "";

        if (typeof(response.responseText) !== "string") {
            response.responseText = JSON.stringify(response.responseText);
        }

        return response;
    };

    var andReturn = function(mock) {
        var mockRequest = mock;
        return (function(data) {
            var response = buildResponse(data);
            var request = findRequest(mockRequest.action, mockRequest.url);
            if (request) {
                mockRequest.responded = true;
                mockRequest.request = request;
                request.response(response);
            } else {
                throw requestNotFound(mockRequest);
            }
        });
    };

    var respondWrap = function(data, mock) {
        var storedResponse = buildResponse(data);
        var mockRequest = mock;
        return (function() {
            var request = findRequest(mockRequest.action, mockRequest.url);
            if (request) {
                mockRequest.responded = true;
                mockRequest.request = request;
                request.response(storedResponse);
            } else {
                throw requestNotFound(mockRequest);
            }
        });
    };

    var andWait = function(mock) {
        var mockRequest = mock;
        return (function(data) {
            var exports = {
                respond: respondWrap(data, mockRequest),
                respondWith: andReturn(mockRequest)
            };

            return exports;
        });
    };

    self.stubRequest = function(action, url) {
        var exports = {
            action: action,
            url: url,
            responded: false
        };

        exports.andReturn = andReturn(exports);
        exports.andWait = andWait(exports);

        mocks[action + "_" + url] = exports;
        return exports;
    };

    self.getRequest = function(action, url) {
        var request = findRequest(action, url);
        return {action: action, url: url, request: request, requested: !!request};
    };

    return self;
}(jasmine.Ajax));