package com.mobingen.location.services.core;

import org.springframework.stereotype.Component;

/**
 * Created by amitsingh on 3/20/14.
 */

@Component
public interface DBServices {

    public String FetchAddressFromDB(String latitute , String longitute);

    void updateAddress(String address, String latitute, String longitute);
}
