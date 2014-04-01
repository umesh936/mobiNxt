package com.mobiNxtGen.location.utility;


import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by amitsingh on 3/19/14.
 */
public class GeoLocationUtility {

    private static final String addfinderUrl = "http://maps.googleapis.com/maps/api/geocode/json?sensor=true&";

    public static String fetchAddressFromInternet(String latitute , String longitute)
    {
        if(latitute==null || longitute==null || latitute.length()<4 || longitute.length()<4)
        {
            return null;
        }

        String result = null;

        try {
            String url =   getUrlfromlatlong(latitute,longitute);
            JSONObject json = readJsonFromUrl(url);
            result =  json.getJSONArray("results").getJSONObject(0).getString("formatted_address");
        } catch (IOException e) {
            e.printStackTrace();
        }

return result;

    }

    private static String getUrlfromlatlong(String lat , String longi)
    {

        return addfinderUrl+ "latlng=" + lat + "," + longi;

    }

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
        InputStream is = new URL(url).openStream();
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            String jsonText = readAll(rd);
            JSONObject json = new JSONObject(jsonText);
            return json;
        } finally {
            is.close();
        }
    }

    public static void main(String[] args) throws IOException, JSONException {
        System.out.println(fetchAddressFromInternet("28.6700", "77.4200")); ;
    }


}
