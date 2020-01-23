#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""/config.py
Description: Configuration options for the service
    I think first saw this style of config in the book "Flask Web development"
Project: 
Author: Hunter Mellema
Date: 1/20/2020
"""
BaseConfig = {
    "blerg": 1, 
    "ROUTES_FILE": 'routes.toml', 
    "TEMPLATE_PATH": './app/templates/'
}
DevConfig = BaseConfig.copy()
TestConfig = BaseConfig.copy()
ProdConfig = BaseConfig.copy()

DevConfig.update({
    "DEBUG": True 
})
    
TestConfig.update({
    "DEBUG": False,
    "TESTING": True
})

ProdConfig.update({ 
    "DEBUG": False
})


config_dict = { 
    'dev': DevConfig,
    'test': TestConfig,
    'prod': ProdConfig,
    'default': DevConfig
}