#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""/config.py
Description: Configuration options for the service
    I think first saw this style of config in the book "Flask Web development"
Project: Python App Template
Author: Hunter Mellema
Date: 1/20/2020
"""
BaseConfig = {
    "blerg": 1, 
    "ROUTES_FILE": 'routes.toml', 
    "TEMPLATE_PATH": './app/templates/'
}
DevConfig, TestConfig, ProdConfig = (BaseConfig.copy() for i in range(3))

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