package com.mobingen.location.services.core;

import com.mobingen.location.com.mobingen.location.common.LocApiRequest;
import com.mobingen.location.com.mobingen.location.common.LocApiResponse;
import com.mobingen.location.com.mobingen.location.common.RequestType;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.PostConstruct;

/**
 * Created by amitsingh on 3/22/14.
 */
public class LocationUpdateService implements ILocationService {

    @Autowired
    LocationServiceFactory factory;


    @PostConstruct
    public void addToFactory()
    {
        factory.addLocationService(RequestType.LOCATION_UPDATE,this);
    }

    @Override
    public void beforeRequestProcess(LocApiRequest lRequest) {

    }

    @Override
    public void afterRequestProcess(LocApiRequest lRequest, LocApiResponse lResponse) {

    }

    @Override
    public LocApiResponse processRequest(LocApiRequest lRequest) {
        return null;
    }
}
