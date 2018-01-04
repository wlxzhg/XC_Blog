<div class="left-content" id="left-content">
        <div class="left-content-list">
            <div class="article-left">
                <h2 class="article-title"><a href="#">${blog.title}</a></h2>
                <input type="hidden" value="${blog.id}">
                <div class="article-content">${blog.text}</div>
                <div class="article-eye">
                    <div class="create-time fa fa-clock-o"> ${blog.createTime}</div>
                    <div class="visit fa fa-eye"> ${blog.browseNum}</div>
                    <div class="comment fa fa-comment"> ${blog.commentNum}</div>
                    <div class="for-good fa fa-heart"> ${blog.likeNum}</div>
                </div>
            </div>
            <div class="article-right">
                <img src="${resourcePath}/static/images/article1/article1.jpg">
            </div>
        </div>
</div>