package com.mobiNxtGen.location.api;

import com.mobiNxtGen.location.com.mobingen.location.common.LocApiRequest;
import com.mobiNxtGen.location.com.mobingen.location.common.LocApiResponse;

import javax.servlet.ServletException;

/**
 * Created by amitsingh on 3/22/14.
 */
public interface LocationApi {

      LocApiResponse updateLocation(LocApiRequest locRequest) throws ServletException;
}
