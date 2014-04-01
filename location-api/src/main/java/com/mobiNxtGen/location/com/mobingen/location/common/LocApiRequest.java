package com.mobiNxtGen.location.com.mobingen.location.common;

/**
 * Created by amitsingh on 3/22/14.
 */
public class LocApiRequest {

    private String requestType;

    private String latitude;

    private String longitude;

    private String msisdn;


    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getMsisdn() {
        return msisdn;
    }

    public void setMsisdn(String msisdn) {
        this.msisdn = msisdn;
    }

    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }
}
