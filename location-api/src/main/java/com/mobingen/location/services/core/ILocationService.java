package com.mobingen.location.services.core;

import com.mobingen.location.com.mobingen.location.common.LocApiRequest;
import com.mobingen.location.com.mobingen.location.common.LocApiResponse;

/**
 * Created by amitsingh on 3/22/14.
 */
public interface ILocationService {

    void  beforeRequestProcess(LocApiRequest lRequest);
    void  afterRequestProcess(LocApiRequest lRequest , LocApiResponse lResponse);
    LocApiResponse processRequest(LocApiRequest lRequest);
}
