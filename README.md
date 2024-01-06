Before anyone asks, no this cannot be used from a roblox game without changes, read below.

This is a tool that allows you to interact with the roblox web api using https://luvit.io
To use this, create a deps folder in your current directory, and run 

This was made to heavely immitate discordia in the way it logs events, and handle errors, when a function fail, it will return the full error from the function, and it will log it in the terminal, so that it doesn't look out of place when using it with discordia (will be able to be turned off in another update)
```
git clone https://github.com/justdie386/rolua
```
Deps needed from lit are

- creationix/coro-http
- luvit/secure-socket

To use this, please refer to the example folder


Please refer to the TODO for the list of features and other improvements that will be made
The TODO list has been made in order of priority.



Now on paper, there could be way to use it from roblox itself, this uses the normal lua functions, it doesn't really use any luvit specific stuff, so if you remove/change the event listener and change the function to make http requests, to ensure it behaves the same when time comes to return values to functions, get the errors, etc, and change the logger so that it, well, works correctly on roblox, AND if you make the roblox urls go throught a proxy (roblox apparently blocks those kind of requests when they come from their games) THEN it should work, so thats a lot of if if if, but on paper, yeah it shouldn't be too hard, just need some good knoweldge of how roblox works (Also you might have to make it all into the same file because roblox's filesystem is kinda weird i don't think you can require files just like with PUC lua/luajit/luvit)

Now beware, i am not gonna do this, if you wanna do it, do it, but don't except much support when doing so, i haven't touched roblox studio ever and don't plan on doing so.
