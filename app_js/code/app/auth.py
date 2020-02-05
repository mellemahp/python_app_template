#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""/app/auth.py
Description: Defines the basic authentication functionalities of the application
    this could be things like validating a JWT or other fancy stuff or checking for 
    a valid session, etc. 
Project: Python App Template
Author: Hunter Mellema
Date: 1/20/2020
"""
#=== Start imports ===# 
# std library
from enum import Enum

# third party imports
from bottle import request, HTTPError

#=== End Imports ===# 

class SessionStatus(Enum): 
    INVALID = 0
    VALID = 1

class ScopeStatus(Enum): 
    ALLOWED = 0
    FORBIDDEN = 1

def auth_wrapper(fxn, scopes, *args): 
    """Generate a new function that validates the request before allowing access to a route

    Args:
        app (bottle.Bottle()): pre-configured application instance 
        cfg (dict): dictionary containing data from routes.toml file

    Notes:
        User scopes from a DB or JWT are checked against the scopes to make sure a user has the 
        correct role to access a page. 

    """
    if "NONE" in scopes: 
        if len(scopes) > 1: 
            raise Exception("If NONE is in scopes, no other scopes are permitted")
        def fxn_return(*args):
            return fxn(*args)
        return fxn_return
        
    def wrapper(*args):
        sess_status, sess_data = validate_session()
        if SessionStatus.VALID == sess_status: 
            scopes_status, scope_data = validate_user_scopes(sess_data)
            if ScopeStatus.ALLOWED == scopes_status:
                return fxn(*args)
            # You probably want to add a log statement here to log when someone tries to access an out of scope piece of data

        # You could Either log bad session token submission here or you could log it at the point where bad session id's are checked 
        # against the database (which is my preference)
        
        return HTTPError(status=403)
        
    return wrapper


def validate_session(): 
    """Somehow this function checks the session token or JWT 

    Returns: 
        (SessionStatus, [sess_data or None])

    Note: 
        This function should check a cookie on the current request for JWT or session data

    """
    return SessionStatus.VALID, {"some_user_id": 1}


def validate_user_scopes(scope_data): 
    """Somehow this function checks the session token or 

    Args: 
        scope_data (???): some sort of data on users scopes 

    Returns 
    """
    return ScopeStatus.ALLOWED, {"more_data": 2}
