package com.mobingen.location.services.impl;

import com.mobingen.location.services.AddressFinder;
import com.mobingen.location.services.core.CacheServices;
import com.mobingen.location.services.core.DBServices;
import com.mobingen.location.utility.GeoLocationUtility;
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

        address =  GeoLocationUtility.fetchAddressFromInternet(latitute,longitute);

        if(address!=null)
        {
            updateDBWithAddress(address,latitute,longitute);
        }

        return address;

    }

    private void updateDBWithAddress(String address, String latitute, String longitute) {

        dBServices.updateAddress(address,latitute,longitute);

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
