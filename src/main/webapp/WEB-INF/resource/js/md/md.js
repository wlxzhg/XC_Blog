$(function() {
    let editorMk = $('#editorMk'),
        showHtml = $('#showHtml'),
        acen_edit = ace.edit('editorMk'),
        //获取md的滚动条
        aceScroll = $(".ace_scrollbar-inner"),
        scrollV = $('.ace_scrollbar-v'),
        save = $('.save_article'),
        illustration = $('.illustrate'),
        publish = $('.publish'),
        transferimg = $('#transferimg'),
        illustrate = $('.illustrate'),
        imgclose = $('.imgclose'),
        geratelink = $('.geratelink'),
        rendererMD = new marked.Renderer(),
        htmlData = '',
        mdData = '',
        // titleReg = /<h.*>.*<\/h\d{1}>/, //匹配第一个标题<h 数字 ...>...</h数字>
        titleReg = /<.*>.*<\/.*>/, //匹配第一行的第一个标签，编辑这编辑的标题不一定是h标签
        zhReg = />([\s\S]*)</img, //匹配标记符中的字符，包括汉字字母数字标点符号等
        // contentReg = /[\w,:\?\.]+/mg; //匹配标记符中的字符，包括汉字字母数字标点符号等
        contentReg = /[^\n`#\*<>-]/mg; //不匹配换行符，#`*<-等markdown标记


    //设置
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

    //代码高亮
    hljs.initHighlightingOnLoad();
    marked.setOptions({
        highlight: function(code) {
            return hljs.highlightAuto(code).value;
        }
    });
    // acen_edit.setTheme('ace/theme/chrome');//设置编辑区的背景样式
    // acen_edit.getSession().setMode('ace/mode/markdown');
    acen_edit.renderer.setShowPrintMargin(false);
    //markdown映射到html
    editorMk.on('keyup', function() {
        mdData = acen_edit.getValue();

        htmlData = marked(mdData);
        // console.log(htmlData)
        showHtml.html(htmlData);
        // console.log(zhReg.exec(mdData))
        // console.log(titleReg.exec(htmlData)[0])
        // $('.ss').html(titleReg.exec(htmlData))
        // console.log($('.ss').html())
        // document.write(titleReg.exec(htmlData))
    })

    //一下为同步滚动条
    //监听md的鼠标滚动
    scrollV.scroll(function() {
        let mdH = scrollV[0].scrollHeight - editorMk[0].clientHeight,
            htmlH = showHtml[0].scrollHeight - showHtml[0].clientHeight,
            mdTop = scrollV.scrollTop(),
            // htmlTop = showHtml.scrollTop(),
            coefficient = Math.ceil(htmlH / mdH) + 1, //+1是丁可多滑
            toTop = mdTop * coefficient; //html滚动倍数
        // console.log(toTop + ':' + mdTop + ":" + coefficient + ":" + mdTop * coefficient)

        showHtml[0].scrollTop = toTop;
        // console.log(mdTop + "：" + toTop)
        // console.log(scrollV.scrollTop() + '$$' + showHtml.scrollTop())
    })

    //以下为点击保存功能，保存后，用户刷新内容不丢失,l类比点赞

    save.click(function() {
        $.ajax({
            type: 'post',
            url: '/writer/save',
            data: {
                value: mdData, //用户写的内容
                name: 'uesr' //传递用户名
            },
            dataType: 'json'
        })
    })

    //以下为发布功能，点击发布后，文章插入到首页第一篇文章
    publish.click(function() {
        let title = titleReg.exec(htmlData)[0],
            shortIntr = '';
        shortIntr = mdData.match(contentReg).join('').substring(0, 120);
        $.ajax({
            type: 'post',
            url: '/writer/publish',
            data: {

                title: title, //首页显示用户标题
                brief: shortIntr,
                text: htmlData, //html的内容
                category: "front_end", //替换成选择的类别
                name: 'uesr' //传递用户名 //不需要

            },
            dataType: 'json',
            success: function() {
                window.location.href = "/publishSucceed/"; //，发布成功跳转页面，不打开新的窗口
            }
        })
    })
    //上传图片,点击上传，编辑者自行将连接敲入编辑区
    //跨浏览器兼容URL对象，返回一个字符串，指向一块内存地址，使用url好处，可以不吧
    //文件内容读取到js中而直接使用文件内容，只要在需要文件内容的地方提供url即可。
    function createObjectURL(blob) {
        if (window.URL) {
            return window.URL.createObjectURL(blob);
        } else if (window.webkitURL) {
            return window.webkitURL.createObjectURL(blob);
        } else {
            return null;
        }
    }


    //跨浏览器兼容
    var EventUtil = {
        addHandler: function(element, type, handler) {
            if (element.addEventListener) {
                element.addEventListener(type, handler, false);
            } else if (element.attachEvent) {
                element.attachEvent("on" + type, handler);
            } else {
                element["on" + type] = handler;
            }
        },
        removeHandler: function(element, type, handler) {
            if (element.removeEventListener) {
                element.removeEventListener(type, handler, false);
            } else if (element.detachEvent) {
                element.detachEvent("on" + type, handler);
            } else {
                element["on" + type] = null;
            }
        },
        getEvent: function(event) {
            return event ? event : window.event;
        },
        getTarget: function(event) {
            return event.target || event.srcElement;
        },
        preventDefault: function(event) {
            if (event.preventDefault) {
                event.preventDefault();
            } else {
                event.returnValue = false;
            }
        }
    };

    var filesList = document.getElementById("files-list");
    //每次上传一张
    EventUtil.addHandler(filesList, "change", function(event) {
        var info = "",
            output = document.getElementById("a"),
            progress = document.getElementById("progress"),
            files = EventUtil.getTarget(event).files,
            selectimg = $('.selectimg'),
            reader = new FileReader(),
            url = createObjectURL(files[0]);
        EventUtil.preventDefault(event);
        if (url) {
            if (/image/.test(files[0].type)) {
                info += files[0].name + " (" + files[0].type + ", " + files[0].size +
                    " bytes)";
                selectimg.text(info);
                output.innerHTML = "<img src=\"" + url + "\">"; //本地能显示，上线后可能不显示
                //构造对象，添加ajax所传输的数据
                //点击生成服务气短的链接
                geratelink.click(function() {
                    let data = new FormData();
                    data.append('img', files[0]);
                    $.ajax({
                        data: data,
                        type: 'post',
                        url: 'decodeImg', //解析图像数据的url
                        dataType: 'jason',
                        success: function(data) {
                            output.innerHTML = data.url; //后台传过来替换
                        }
                    })
                })

            } else {
                output.innerHTML = "Not an image.";
            }
        } else {
            output.innerHTML = "Your browser doesn't support object URLs.";
        }
    });
    illustrate.click(function() {
        transferimg.show();
    })
    imgclose.click(function() {
        transferimg.hide();

    })
})