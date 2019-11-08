#! /usr/bin/env python3

import responder
import cv2
from PIL import Image

api = responder.API()

@api.route("/{greeting}")
async def greet_world(req, resp, *, greeting):
    resp.text = f"{greeting}, world!!"

if __name__ == '__main__':
    api.run()
