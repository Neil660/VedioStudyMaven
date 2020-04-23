package log.tools.time;

import java.sql.Time;

/**
 * 时间转换工具
 */
public class SqlTime {
    public static int changeToInt(Time time){
        String[] split = time.toString().split(":");
        int timeInt = 0;
        for (int i = 0; i < 3; i++) {
            int t = Integer.parseInt(split[i]);
            if(i == 0)
                timeInt += t * 3600;
            if(i == 1)
                timeInt += t * 60;
            if(i == 2)
                timeInt += t;
        }
        return timeInt;
    }
}
