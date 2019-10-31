<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${mapperPackage}">

    <select id="${pageList}" parameterType="java.util.Map" resultType="${voPackage}">
        SELECT
			*
		FROM
			(<include refid="${sqlList}"/>) AS dat
		ORDER BY
			dat.create_ts DESC

		<if test="page != null and page.pageSize > 0">
			<![CDATA[ limit ${r"#{page.pageSize}"} offset (${r"#{page.recordStart}"}-1) ]]>
		</if>
    </select>

    <select id="${pageCount}" parameterType="java.util.Map" resultType="java.lang.Integer">
        SELECT
			COUNT(*)
		FROM (
			<include refid="${sqlList}"/>
		) AS dat
    </select>

	<#if hasForm == '1'>
	<select id="${getVoById}" parameterType="java.util.Map" resultType="${voPackage}">
        SELECT
			*
		FROM
			(<include refid="${sqlList}"/>) AS dat
		WHERE
			dat.id = ${r"#{condition.id}"}
    </select>
	</#if>

    <sql id="${sqlList}">
		SELECT
			*
		FROM
			t_jj_table_name t
		WHERE 1=1

		<if test="condition.field != null and condition.field != ''">
			AND t.field LIKE CONCAT('%', ${r"#{condition.field}"}, '%')
		</if>
    </sql>

</mapper>