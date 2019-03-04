# weston-rdp

Docker fedora-based image that runs weston compositor rdp backend.
You can launch it with:
```bash
$ docker run -p 3390:3389 technic93/weston-rdp
```
Then connect to `localhost:3390` with you favourite rdp client (for example windows build-in).
You may install, build and test some gui applications under wayland now.
