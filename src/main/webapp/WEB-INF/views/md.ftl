<!DOCTYPE html>
<html>

<head>
    <title>MARKDOWN编辑</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="http://cdn.bootcss.com/highlight.js/8.0/styles/monokai_sublime.min.css" rel="stylesheet">
     <link rel="stylesheet" href="${resourcePath}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    
    <script src="${resourcePath}/static/jq/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${resourcePath}/static/markDownStatic/marked.min.js"></script>
    <script src="${resourcePath}/static/markDownStatic/ace.js"></script>
    <script src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script>
    <script src="${resourcePath}/js/md/md.js"></script>

</head>

<body>
	<div id="editorHeader">
		<ul>
			<li><a href="/"><span class="fa fa-home">返回首页</a></li>
				<li><span class="fa fa-save"></span>保存</li>
				<li><span class="fa fa-share"></span>发布</li>
		</ul>
	</div>
    <div class="editor-wrap">
        <pre id="editorMk"> </pre>
        <div id="showHtml"></div>
    </div>
    <!-- <div id="aa"></div> -->
</body>


</html>