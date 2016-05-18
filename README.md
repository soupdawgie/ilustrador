## Ilustrador

**Ilustrador** is an image generator for the social network announcements.

### Stack

Sinatra + imgkit + wkhtmltoimage-binary.

### High-level overview

The app receives a GET request (that controls contents of an output) and redirects a client to the result image (or returns a direct link for downloading it). A process (maybe a background job) deletes images from time to time.

### Params

- **format**: image format (jpeg, png, gif)
- **resolution**: resolution of the image (probably could be predefined)
- **category**: post category (to be shown in the corner of an image)
- **text**: fixed size string, font size depends on its length
- **logo**: fixed size brand logo (could be processed on the server side)
- **background**: background image (could be processed on the server side)
- **background-direction**: direction of the gradient overlay (left-to-right (LR), top-to-bottom (TB), etc)
- **style**: name of the predefined style (if any)
