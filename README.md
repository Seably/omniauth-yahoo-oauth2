# OmniAuth Yahoo OAuth2 Strategy

Strategy to authenticate with Yahoo via OAuth2 in OmniAuth, based on `omniauth-oauth2`.


Add the gem and then add the necessary config:

```
# /config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :yahoo_oauth2,
           ENV["YAHOO_CLIENT_ID"],
           ENV["YAHOO_CLIENT_SECRET"],
           scope: "openid2",
           name: "yahoo"
end
```
