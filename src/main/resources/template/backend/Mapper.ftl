<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${mapperPackage}">

    <select id="${pageList}" parameterType="java.util.Map" resultType="${voPackage}">
		<include refid="${sqlList}"/>
		<include refid="${sqlList}_where"/>

		ORDER BY
			t.create_ts DESC

		<if test="page != null and page.pageSize > 0">
			<![CDATA[ limit ${r"#{page.pageSize}"} offset (${r"#{page.recordStart}"}-1) ]]>
		</if>
    </select>

    <select id="${pageCount}" parameterType="java.util.Map" resultType="java.lang.Integer">
        SELECT
			COUNT(*)
		FROM (
			<include refid="${sqlList}"/>
			<include refid="${sqlList}_where"/>
		) AS dat
    </select>

	<select id="${getVoById}" parameterType="java.util.Map" resultType="${voPackage}">
		<include refid="${sqlList}"/>
		AND t.id = ${r"#{condition.id}"}
    </select>

    <sql id="${sqlList}">
		SELECT
			*
		FROM
			${tableName} t
		WHERE 1=1
    </sql>

	<sql id="${sqlList}_where">
		<!--<if test="condition.name != null and condition.name != ''">
			AND t.name LIKE CONCAT('%', ${r"#{condition.name}"}, '%')
		</if>-->
    </sql>

</mapper>