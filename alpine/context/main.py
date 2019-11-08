#! /usr/bin/env python3

import responder
from Cython.Build import cythonize

api = responder.API()

@api.route("/{greeting}")
async def greet_world(req, resp, *, greeting):
    resp.text = f"{greeting}, world!!"

if __name__ == '__main__':
    api.run()
