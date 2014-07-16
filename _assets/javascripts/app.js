function expandNavigation(url) {
    return function() {
        var segments = url.split("/");
        var page = segments[segments.length - 1];
        var tree = this;

        if (segments.length > 1) {
            var path = segments.slice();
            tree.expandPath(segments, function() {
                var dataSource = tree.dataSource;
                var node;

                for (var idx = 0; idx < path.length; idx++) {
                   node = dataSource.get(path[idx]);
                   dataSource = node.children;
                }

                node.set("selected", true);
            });
        } else {
            tree.dataSource.get(page).set("selected", true);
        }

        tree.unbind("dataBound", arguments.callee);
    }
}

function navigationTemplate(root) {
    return function(data) {
        var item = data.item;
        var text = item.text;

        if (item.hasChildren) {
            return text;
        }

        var url = item.path;

        if (location.pathname.indexOf(".html") < 0) {
            url = url.replace(".html", "");
        }

        while (item = item.parentNode()) {
            url = item.path + "/" + url;
        }

        return '<a href="' + root + url + '">' + text + "</a>";
    }
}

function preventParentSelection(e) {
    if (this.dataItem(e.node).hasChildren) {
        e.preventDefault();
        this.toggle(e.node);
    }
}

$(function(){
    $("pre").addClass("prettyprint");

    prettyPrint();

    $("#markdown-toc").each(function() {
        var ul = $("<ul>");

        $("#page-article h2").each(function() {
            var h2 = $(this);

            if (!/fields|configuration|properties|events|methods/i.test(h2.text())) {
                return;
            }

            $("<li>")
                .addClass("section")
                .append(h2.children().clone())
                .appendTo(ul)
                .mouseenter(function() {
                    var children = $(this).children("ul");

                    if (!children.length) {
                        children = $("<ul>");

                        h2.nextUntil("h2").filter("h3").each(function(){
                            $("<li>").append($(this).children().clone()).appendTo(children);
                        });

                        if (children.children().length) {
                            children.appendTo(this);
                        }
                    }

                    children.show();
                })
                .mouseleave(function() {
                    $(this).children("ul").hide();
                });
        });

        ul.appendTo(this);
    });
});
