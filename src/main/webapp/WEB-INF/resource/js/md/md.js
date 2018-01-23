$(function() {
    let editorMk = $('#editorMk'),
        showHtml = $('#showHtml'),
        acen_edit = ace.edit('editorMk'),
        rendererMD = new marked.Renderer();

    //代码高亮
    hljs.initHighlightingOnLoad();
    marked.setOptions({
        renderer: rendererMD,
        gfm: true,
        tables: true,
        breaks: false,
        pedantic: false,
        sanitize: false,
        smartLists: true,
        smartypants: false
    });

    marked.setOptions({
        highlight: function(code) {
            return hljs.highlightAuto(code).value;
        }
    });
    // acen_edit.setTheme('ace/theme/chrome');
    // acen_edit.getSession().setMode('ace/mode/markdown');
    acen_edit.renderer.setShowPrintMargin(false);
    editorMk.on('keyup', function() {
        showHtml.html(marked(acen_edit.getValue()));
    })
})