package com.mobiNxtGen.location.services.core.impl;

import com.mobiNxtGen.location.services.core.DBServices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 * Created by amitsingh on 3/20/14.
 */


@Component
public class DBServicesImpl implements DBServices {





    @Autowired
    public JdbcTemplate jdbcTemplate;

    @Value( "${mobiNextGen.locationServices.enable}" )
    private String dbConfigured;

    @Override
    public String FetchAddressFromDB(String latitute, String longitute) {

        if(dbConfigured!=null && "true".equals(dbConfigured))
        {

        }

        return null;
    }

    @Override
    public void updateAddress(String address, String latitute, String longitute) {

    }
}
