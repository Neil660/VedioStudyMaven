package log.tools.redis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * jedis连接
 */
public class JedisConnection {

    private static String PASSWORD = "root";

    private static Jedis jedis;

    public JedisConnection(){
        JedisPoolUtils jpu = new JedisPoolUtils();
        JedisPool jp = jpu.getJedisPool();
        jedis = jp.getResource();
        jedis.auth(PASSWORD);
    }

    public Jedis getJedis() {
        return jedis;
    }

    public void setJedis(Jedis jedis) {
        this.jedis = jedis;
    }
}
