package log.tools.redis;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * jedis连接池
 */
public class JedisPoolUtils {

    private static String JEDIS_HOST = "127.0.0.1"; //IP
    private static int JEDIS_PORT = 6379;   //端口号
    private static int JEDIS_MAXLDLE = 32;  //最大空闲连接
    private static int JEDIS_MAXTOTAL = 500;    //最大活动连接
    private static int JEDIS_MAXWAIRMILLIS = 100000;    //最长等待时间

    private static JedisPool jedisPool = null;

    public JedisPoolUtils() {
        try {
            synchronized(JedisPoolUtils.class){  //解决高并发问题
                JedisPoolConfig jpc = new JedisPoolConfig();    //获取jedispool连接池配置类
                jpc.setMaxIdle(JEDIS_MAXLDLE);
                jpc.setMaxTotal(JEDIS_MAXTOTAL);
                jpc.setMaxWaitMillis(JEDIS_MAXWAIRMILLIS);
                jedisPool = new JedisPool(jpc, JEDIS_HOST, JEDIS_PORT);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
    }

    public JedisPool getJedisPool() {
        return jedisPool;
    }

    public void setJedisPool(JedisPool jedisPool) {
        this.jedisPool = jedisPool;
    }
}
