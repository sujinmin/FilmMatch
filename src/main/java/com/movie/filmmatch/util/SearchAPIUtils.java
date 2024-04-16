package com.movie.filmmatch.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.movie.filmmatch.movieapi.vo.PosterVo;



public class SearchAPIUtils{
	

	public static List<PosterVo> search_text(String query) throws Exception {

            List<PosterVo> list = new ArrayList<PosterVo>();

            String urlStr = "";
            String clientId = "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzE5ZDc5YjU5NDNkYTgxNWEyYWY5NDRhNjNlZjI4MSIsInN1YiI6IjY1ZjAxMWE0NjZhN2MzMDBjYWRkYmJhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xFFFvCXvNIZSbwFYVN591kIVeKIQnkMs7nAQ6CAxLDA";
            String clientSecret = "d719d79b5943da815a2af944a63ef281";
            String accept = "accept: application/json";
            URL url = null;
            HttpURLConnection urlConn=null;
            BufferedReader br = null;

            for (int page = 1; page <= 12; page++) {
            urlStr = "https://api.themoviedb.org/3/search/movie?query="+ query +"&include_adult=false&language=ko&page="+ page;

        try{
                
                url = new URL(urlStr);
                urlConn = (HttpURLConnection) url.openConnection();
                urlConn.setRequestProperty("key", clientSecret);
                urlConn.setRequestProperty("Authorization", clientId);
                urlConn.setRequestProperty("accept", accept);
                urlConn.connect();
                InputStream is = urlConn.getInputStream();
                InputStreamReader isr = new InputStreamReader(is, "utf-8");
                br = new BufferedReader(isr);
    
                StringBuffer sb = new StringBuffer();
                String data;
                    while ((data = br.readLine()) != null) {
                        sb.append(data);
                    }
    
                JSONObject json = new JSONObject(sb.toString());
		        JSONArray posterArray = json.getJSONArray("results");
		
		
		for(int i=0; i<posterArray.length(); i++) {
			
			JSONObject ps = posterArray.getJSONObject(i);
			
			String id = ps.getDouble("id")+"";
			String title = ps.getString("title");
			
			String overview = "";
            if (!ps.isNull("overview")) { // profile_path가 null이 아닌 경우에만 가져옴
                overview = ps.getString("overview");
            } else {
				overview = "";
            }
			String popularity = ps.getDouble("popularity")+"";
			String poster_path = ps.getString("poster_path");
			String release_date = ps.getString("release_date");
			String vote_average = ps.getDouble("vote_average")+"";
			
			PosterVo vo = new PosterVo(id,title, overview, popularity, poster_path, release_date, vote_average);
			
			list.add(vo);

			
		}
     
        
    }catch(Exception e){
    
    }
      

    }
    return list;
    }
}

	