package com.mugs.etc;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

/**
 * JsonSerializer : VO를 JSON으로 변환시 특정타입의 property를 어떤 형식의 문자열로 변환
 * 
 * java.util.Date => 밀리초로 변환한다.
 * 
 * @author Administrator
 *
 */
public class DateJSONSerializer extends JsonSerializer<Date>{

	@Override
	/*
	 * 매개변수 1. 변환할값
	 * 			2. 변환한 내용을 컨버터에게 출력ㅐ주는 메소드 제공
	 * 
	 */
	public void serialize(Date date, JsonGenerator gen, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		String dateString = new SimpleDateFormat("yyyy-MM-dd").format(date);
		gen.writeString(dateString);
	}
}
