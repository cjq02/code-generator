<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${mapperPackage}">

    <select id="${pageList}" parameterType="java.util.Map" resultType="${voPackage}">
		<include refid="${sqlData}_list"/>
		<include refid="${sqlData}_where"/>

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
			<include refid="${sqlData}_list"/>
			<include refid="${sqlData}_where"/>
		) AS dat
    </select>

	<select id="${getVoById}" parameterType="java.util.Map" resultType="${voPackage}">
		<include refid="${sqlData}"/>
		AND t.id = ${r"#{condition.id}"}
    </select>

	<select id="get${actionName}ByParam" parameterType="java.util.Map" resultType="${voPackage}">
		<include refid="${sqlData}"/>
		<include refid="${sqlData}_where"/>
	</select>

	<sql id="${sqlData}">
		SELECT
			*
		FROM
			${tableName} t
		WHERE 1=1
    </sql>

    <sql id="${sqlData}_list">
		SELECT
			*
		FROM
			${tableName} t
		WHERE 1=1
    </sql>

	<sql id="${sqlData}_where">
		<!--<if test="condition.name != null and condition.name != ''">
			AND t.name LIKE CONCAT('%', ${r"#{condition.name}"}, '%')
		</if>-->
    </sql>

</mapper>