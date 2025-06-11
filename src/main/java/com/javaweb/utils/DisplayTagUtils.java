package com.javaweb.utils;

import com.javaweb.model.dto.AbstractDTO;
import org.apache.commons.lang.StringUtils;
import org.displaytag.tags.TableTagParameters;
import org.displaytag.util.ParamEncoder;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

public class DisplayTagUtils {

    //private static final Logger log = Logger.getLogger(DisplayTagUtils.class);

    public static void of(HttpServletRequest request, AbstractDTO dto) {
        if (dto != null) {
            String string = new ParamEncoder(dto.getTableId()).encodeParameterName(TableTagParameters.PARAMETER_PAGE);
            String sPage = request.getParameter(string);
            Integer page = 1;
            if (StringUtils.isNotBlank(sPage)) {
                try {
                    page = Integer.parseInt(sPage);
                } catch (Exception e) {
                    //log.error(e.getMessage());
                }
            }
            dto.setPage(page);
        }
    }
}
