package com.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dto.WordDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



public class search {

    public static void main(String[] args) {
        String clientId = "dc8f1q41qcRkkMrT0abk"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "mX6xlacNY0"; //애플리케이션 클라이언트 시크릿값"

        String text = null;
        try {
            text = URLEncoder.encode("컴퓨터", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/encyc?query=" + text;    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
//        System.out.println(responseBody);
        
//        String[] arr = responseBody.split(",");
//        System.out.println("배열의 길이: "+arr.length);
//        for(int i=0;i<arr.length;i++) {
//        	System.out.println(i+"번째: "+arr[i]);
//        }
       
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(responseBody);
        
        List<WordDto> dtos = new ArrayList<WordDto>();
        
        for(int i=0;i<element.getAsJsonObject().get("items").getAsJsonArray().size();i++) {
        	
//        	System.out.println(element.getAsJsonObject().get("items").getAsJsonArray().get(i));
        	
        	JsonObject tmp = element.getAsJsonObject().get("items").getAsJsonArray().get(i).getAsJsonObject();
        	
        	JsonElement title_je = tmp.get("title");
        	JsonElement link_je = tmp.get("link");
        	JsonElement description_je = tmp.get("description");
        	JsonElement thumbnail_je = tmp.get("thumbnail");
        	
        	String title = title_je.getAsString();
        	String link = link_je.getAsString();
        	String description = description_je.getAsString();
        	String thumbnail = thumbnail_je.getAsString();
        	
        	WordDto dto = new WordDto();
        	dto.setTitle(title);
        	dto.setLink(link);
        	dto.setDescription(description);
        	dto.setThumbnail(thumbnail);
        	
        	System.out.println(dto.toString());
//        	dtos.add(dto);
        	
        }

        
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    
  
    
    
}
