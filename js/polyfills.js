// Overwrites native 'children' prototype. Adds Document &
// DocumentFragment support. Returns array instead of HTMLCollection.
// https://developer.mozilla.org/en-US/docs/Web/API/ParentNode/children
;(function(constructor) {
    if (constructor &&
        constructor.prototype &&
        constructor.prototype.children == null) {
        Object.defineProperty(constructor.prototype, 'children', {
            get: function() {
                var i = 0, node, nodes = this.childNodes, children = [];
                while (node = nodes[i++]) {
                    if (node.nodeType === 1) {
                        children.push(node);
                    }
                }
                return children;
            }
        });
    }
})(window.Node || window.Element);

// Add ability to query XPath expressions (IE11). Release 1.3 of
// Wicked-Good-XPath added support for XPath on XML documents.
// https://github.com/google/wicked-good-xpath
wgxpath.install();
