package com.mobingen.location.services.core;

import org.springframework.stereotype.Component;

/**
 * Created by amitsingh on 3/19/14.
 */

@Component
public interface CacheServices {

    public String FetchAddressIfAvailable(String latitute , String longitute);
}
