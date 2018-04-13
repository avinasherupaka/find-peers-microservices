package com.avinash.blog

import io.getquill.{CassandraAsyncContext, SnakeCase}

trait Cassandra {
  implicit val ctx = new CassandraAsyncContext[SnakeCase]("cassandra")
}
