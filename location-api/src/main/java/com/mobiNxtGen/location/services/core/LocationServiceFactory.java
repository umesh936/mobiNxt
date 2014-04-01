package com.mobiNxtGen.location.services.core;

import com.mobiNxtGen.location.services.core.ILocationService;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by amitsingh on 3/22/14.
 */
public class LocationServiceFactory {

    private Map<String, ILocationService> map = new HashMap<String, ILocationService>();

    public ILocationService getLocationService(final String requestType) {

        if (requestType == null)
            new NullPointerException("requestType can't be null while fetching the LocationService");

        return map.get(requestType);
    }

    public void addLocationService(final String requestType, final ILocationService locationService) {
        map.put(requestType, locationService);
    }
}
