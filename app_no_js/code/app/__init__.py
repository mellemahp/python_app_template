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
from flask import Flask

# standard library 

# local imports 
from config import config

#=== End Imports ===# 

def build_app(mode): 
    """ Builds a new app instance with specified configuration

    :param mode: Mode to use (choose one of ['dev', 'test', 'prod'])
    :type mode: str

    """
    app = Flask(__name__)

    # add the configuration parameters to app instance
    app.config.from_object(config[mode])

    # add routes here!

    # add other setup here. It is recommended to add logging

    return app