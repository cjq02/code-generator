<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${mapperPackage}">

    <select id="${pageList}" parameterType="java.util.Map" resultType="${voPackage}">
        SELECT
			*
		FROM
			(<include refid="${sqlList}"/>) AS dat

		<if test="page != null" >
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

    <sql id="${sqlList}">

    </sql>

</mapper>