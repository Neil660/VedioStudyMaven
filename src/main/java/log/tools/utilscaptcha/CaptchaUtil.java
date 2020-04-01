package log.tools.utilscaptcha;

import java.awt.*;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import log.tools.basecaptcha.Captcha;
import log.tools.captcha.SpecCaptcha;

/**
 * 图形验证码工具类
 */
public class CaptchaUtil {
    private static final String SESSION_KEY = "captcha";
    private static final int DEFAULT_LEN = 4;  // 默认长度
    private static final int DEFAULT_WIDTH = 130;  // 默认宽度
    private static final int DEFAULT_HEIGHT = 48;  // 默认高度

    public static final String aa = "kejian";

    /**
     * 输出验证码1
     */
    public static void out(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        out(DEFAULT_LEN, request, response);
    }

    /**
     * 输出验证码2
     */
    public static void out(int len, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        out(DEFAULT_WIDTH, DEFAULT_HEIGHT, len, request, response);
    }

    /**
     * 输出验证码3
     */
    public static void out(int width, int height, int len, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        out(width, height, len, null, request, response);
    }

    /**
     * 输出验证码
     */
    public static void out(Font font, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        out(DEFAULT_WIDTH, DEFAULT_HEIGHT, DEFAULT_LEN, font, request, response);
    }

    /**
     * 输出验证码
     */
    public static void out(int len, Font font, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        out(DEFAULT_WIDTH, DEFAULT_HEIGHT, len, font, request, response);
    }

    /**
     * 输出验证码4
     */
    public static void out(int width, int height, int len, Font font, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        SpecCaptcha specCaptcha = new SpecCaptcha(width, height, len);
        if (font != null) {
            specCaptcha.setFont(font);
        }
        out(specCaptcha, request, response);
    }


    /**
     * 输出验证码5
     */
    public static void out(Captcha captcha, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        setHeader(response);
        request.getSession().setAttribute(SESSION_KEY, captcha.text().toLowerCase());
        captcha.out(response.getOutputStream());
    }

    /**
     * 验证验证码
     * @param code    用户输入的验证码
     * @param request HttpServletRequest
     * @return 是否正确
     */
    public static boolean ver(String code, HttpServletRequest request) {
        if (code != null) {
            String captcha = (String) request.getSession().getAttribute(SESSION_KEY);
            System.out.println("session设定成功");
            return code.trim().toLowerCase().equals(captcha);
        }
        System.out.println("验证码为空");
        return false;
    }

    /**
     * 清除session中的验证码
     */
    public static void clear(HttpServletRequest request) {
        request.getSession().removeAttribute(SESSION_KEY);
    }

    /**
     * 设置相应头
     */
    public static void setHeader(HttpServletResponse response) {
        response.setContentType("image/gif");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
    }

}
