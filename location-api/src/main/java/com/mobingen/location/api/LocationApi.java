package com.mobingen.location.api;

import com.mobingen.location.com.mobingen.location.common.LocApiRequest;
import com.mobingen.location.com.mobingen.location.common.LocApiResponse;

import javax.servlet.ServletException;

/**
 * Created by amitsingh on 3/22/14.
 */
public interface LocationApi {

      LocApiResponse updateLocation(LocApiRequest locRequest) throws ServletException;
}
