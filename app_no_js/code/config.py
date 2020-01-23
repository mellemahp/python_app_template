#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""/config.py
Description: Configuration options for the service
    I think first saw this style of config in the book "Flask Web development"
Project: 
Author: Hunter Mellema
Date: 1/20/2020
"""
class BaseConfig: 
    COMMON_1 = 1

class DevConfig(BaseConfig): 
    DEBUG = True 

class TestConfig(BaseConfig): 
    DEBUG = False 
    TESTING = True

class ProdConfig(BaseConfig): 
    DEBUG = False


config = { 
    'dev': DevConfig
    'test': TestConfig
    'prod': ProdConfig
    'default': DevConfig
}