package com.mobiNxtGen.location.services.core;

import com.mobiNxtGen.location.com.mobingen.location.common.LocApiRequest;
import com.mobiNxtGen.location.com.mobingen.location.common.LocApiResponse;

/**
 * Created by amitsingh on 3/22/14.
 */
public interface ILocationService {

    void  beforeRequestProcess(LocApiRequest lRequest);
    void  afterRequestProcess(LocApiRequest lRequest , LocApiResponse lResponse);
    LocApiResponse processRequest(LocApiRequest lRequest);
}
