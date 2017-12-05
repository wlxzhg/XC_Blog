package cn.xiaozhigang.blog.ext;

import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class FreeMarkerViewExt extends FreeMarkerView{
    private static final String CONTEXT_PATH = "basePath";
    private static final String RESOURCE_PATH = "resourcePath";
    @Override
    protected void exposeHelpers(Map<String, Object> model, HttpServletRequest request)
            throws Exception {
        model.put(CONTEXT_PATH, request.getContextPath());
        model.put(RESOURCE_PATH,request.getContextPath() + "/resource");
        super.exposeHelpers(model, request);
    }
}
