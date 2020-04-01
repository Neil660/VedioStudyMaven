package log.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;

/**
 * 视频观看记录表
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Recode implements Serializable {

    /**
     * 记录id
     */
    private int id;

    /**
     * 用户id
     */
    private int userID;

    /**
     * 视频id
     */
    private int vedioID;

    /**
     * 视频标题
     */
    private String title;

    /**
     * 视频地址
     */
    private String url;

    /**
     * 视频发布者
     */
    private String publisher;

    /**
     * 视频点击率
     */
    private int count;

    /**
     * 用户观看视频的日期
     */
    private Timestamp date;

    /**
     * 用户观看视频的位置，单位：秒
     */
    private int time;
}

