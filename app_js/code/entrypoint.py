#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""/entrypoint.py
Description: Simple application factory. Builds application for WSGI server.
Project: Python App Template
Author: Hunter Mellema
Date: 1/20/2020
"""
#=== Start imports ===# 
# standard library 
import os 

# local 
from app import build_app

#=== End imports ===#

application = build_app(mode=os.getenv('APP_MODE', default='default'))

