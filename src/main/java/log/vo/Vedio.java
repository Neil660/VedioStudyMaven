package log.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * 视频信息表
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Vedio implements Serializable {

    /**
     * 视频id
     */
    private int id;

    /**
     * 视频标题
     */
    private String vedioTitle;

    /**
     * 视频地址
     */
    private String url;

    /**
     * 视频发布者
     */
    private String publisher;

    /**
     * 视频发布时间
     */
    private Timestamp release;

    /**
     * 视频点击率
     */
    private int count;

    /**
     * 视频时长
     */
    private Time time;

    /**
     * 视频标签
     */
    private String category;

    /**
     * 视频介绍
     */
    private String introduce;

    /**
     * 视频积分
     */
    private int integral;
}


