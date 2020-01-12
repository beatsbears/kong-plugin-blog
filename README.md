# Kong Docker Setup with Custom Plugins

I've created this repo to illustrate how Kong can be configured to run locally using docker-compose to provide support for dependencies (postgres) and GUI support (Konga/Mongo).

You can read more in my blog post [here](https://medium.com/@aclaytonscott) or get started now by running `docker-compose build && docker-compose up` then navigating to http://127.0.0.1:1337/ .

Note: This configuration of Kong should be used for local development and testing purposes only - while Kong itself is proven for Production use, this configuration is insecure and somewhat simplified.