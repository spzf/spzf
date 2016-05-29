package com.spzf.component.redis;

import redis.clients.jedis.ShardedJedis;


/**
 * @Comment:redis数据源接口
 * @author bruce.liu
 * @Create Date 2014年3月24日
 */
public interface IRedisDataSource {

	/**
	 * 取得redis的客户端
	 * 
	 * @return
	 */
	public abstract ShardedJedis getRedisClient();

	/**
	 * 将资源返还给pool
	 * 
	 * @param shardedJedis
	 */
	public void returnResource(ShardedJedis shardedJedis);

	/**
	 * 出现异常后，将资源返还给pool
	 * 
	 * @param shardedJedis
	 * @param broken
	 */
	public void returnResource(ShardedJedis shardedJedis, boolean broken);
}
