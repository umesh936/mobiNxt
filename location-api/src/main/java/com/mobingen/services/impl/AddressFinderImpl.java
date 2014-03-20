package com.mobingen.services.impl;

import com.mobingen.services.AddressFinder;
import com.mobingen.services.core.CacheServices;
import com.mobingen.services.core.DBServices;
import com.mobingen.services.utility.GeoLocationUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by amitsingh on 3/19/14.
 */

@Component
public class AddressFinderImpl implements AddressFinder{

    @Autowired
    CacheServices  cacheServices;

    @Autowired
    DBServices dBServices;


    public String getAddress(String latitute, String longitute)
    {
     String address = checkAlreadyExist(latitute,longitute);
        if(address!=null)
        {
            return address;
        }

        return GeoLocationUtility.fetchAddressFromInternet(latitute,longitute);


    }

    private String checkAlreadyExist(String latitute, String longitute) {
      String address =   cacheServices.FetchAddressIfAvailable(latitute,longitute);
        if(address!=null)
        {
            return address;
        }

        address = dBServices.FetchAddressFromDB(latitute,longitute);

        return address;


    }

}
