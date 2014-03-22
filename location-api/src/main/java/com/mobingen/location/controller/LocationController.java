package com.mobingen.location.controller;

import com.mobingen.location.api.LocationApi;
import com.mobingen.location.com.mobingen.location.common.LocApiRequest;
import com.mobingen.location.com.mobingen.location.common.LocApiResponse;
import com.mobingen.location.services.core.ILocationService;
import com.mobingen.location.services.core.LocationServiceFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;

/**
 * Created by amitsingh on 3/22/14.
 */
public class LocationController implements LocationApi{

    @Autowired
    LocationServiceFactory factory;
    @Override
    public LocApiResponse updateLocation(LocApiRequest locRequest) throws ServletException {

        if(locRequest !=null)
        {
            ILocationService service = factory.getLocationService(locRequest.getRequestType());
           return service.processRequest(locRequest);
        }

        return null;
    }
}
