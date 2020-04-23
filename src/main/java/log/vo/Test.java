package log.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 题目表
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Test implements Serializable {
    /**
     * 题目id
     */
    private int id;

    /**
     * 题目对应的视频
     */
    private int vid;

    /**
     * 题目编号
     */
    private int testNum;

    /**
     * 题干
     */
    private String stem;

    /**
     * 选项a
     */
    private String optiona;

    /**
     * 选项b
     */
    private String optionb;

    /**
     * 选项c
     */
    private String optionc;

    /**
     * 选项d
     */
    private String optiond;

    /**
     * 题目答案
     */
    private String key;
}
