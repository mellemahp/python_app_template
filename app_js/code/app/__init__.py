#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""/app/__init__.py
Description: Application factory for Template app
Project: Python App Template
Author: Hunter Mellema
Date: 1/20/2020
"""
#=== Start imports ===# 

# third party
import bottle
from bottle import Bottle
import toml

# local imports 
from config import config_dict
from . import views
from .auth import auth_wrapper

#=== End Imports ===# 

def build_app(mode): 
    """ Builds a new app instance with specified configuration

    Args: 
        mode (str): Mode to use (choose one of ['dev', 'test', 'prod'])

    """
    app = Bottle()

    # add the configuration parameters to app instance
    app.config = config_dict[mode]
    app.debug = app.config["DEBUG"]
    bottle.TEMPLATE_PATH.insert(0, app.config["TEMPLATE_PATH"])

    # load toml route configuration file 
    with open(app.config['ROUTES_FILE']) as f: 
        cfg = toml.load(f)

    # add all pages and routes
    add_routes(app, cfg)

    # add other setup here like databases and such

    return app


def add_routes(app, cfg):
    """Adds all routes from the routes file to the application route table

    Args:
        app (bottle.Bottle()): pre-configured application instance 
        cfg (dict): dictionary containing data from routes.toml file

    Notes:
        Edits application in place

    """
    for route in cfg['routes'][0]:
        c = cfg['routes'][0][route][0]
        module, fxn = c['handler'].split(".")
        app.route(
            path=c['route'], 
            name=route, 
            method=c['methods'], 
            callback=auth_wrapper(getattr(globals()[module], fxn), c['auth'])
        )

    