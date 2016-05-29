package com.spzf.component.redis.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

import com.spzf.component.redis.IRedisDataSource;
/**
 * @Comment:redis数据源实现类
 * @author bruce.liu
 * @Create Date 2014年3月24日
 */
@Repository("redisDataSource")
public class RedisDataSourceImpl implements IRedisDataSource {
	private static final Logger log = Logger
			.getLogger(RedisDataSourceImpl.class);
	@Resource
	private ShardedJedisPool shardedJedisPool;

	public ShardedJedis getRedisClient() {
		try {
			ShardedJedis shardJedis = shardedJedisPool.getResource();
			return shardJedis;
		} catch (Exception e) {
			log.error("getRedisClent error", e);
		}
		return null;
	}

	public void returnResource(ShardedJedis shardedJedis) {
		shardedJedisPool.returnResource(shardedJedis);
	}

	public void returnResource(ShardedJedis shardedJedis, boolean broken) {
		if (broken) {
			shardedJedisPool.returnBrokenResource(shardedJedis);
		} else {
			shardedJedisPool.returnResource(shardedJedis);
		}
	}

	public void setShardedJedisPool(ShardedJedisPool shardedJedisPool) {
		this.shardedJedisPool = shardedJedisPool;
	}

}
