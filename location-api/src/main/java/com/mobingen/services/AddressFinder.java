package com.mobingen.services;

import org.springframework.stereotype.Component;

/**
 * Created by amitsingh on 3/19/14.
 */

@Component
public interface AddressFinder {

    public String getAddress(String latitute, String longitute);
}
