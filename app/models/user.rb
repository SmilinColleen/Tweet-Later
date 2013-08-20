class User < ActiveRecord::Base

  def self.create_or_find_user(access_token)
    p access_token

    

    if User.find_by_username(access_token.params[:screen_name]) == nil
      @user = User.create(username: access_token.params[:screen_name], 
          oauth_token: access_token.token, 
          oauth_secret: access_token.secret)
      p @user
    else
      p 'already exists'
      @user = User.find_by_username(access_token.params[:screen_name])
      
    end
  end

end


# access_token printed above #<OAuth::AccessToken:0x007fb3fde5c500
# @token="36882967-CCYJFHQ9LltmQXeOLa8STx9hlkFBpgF9i3ir0TrS5",
# @secret="G3NytPrnVMlOsr99DDhNX1t0CkeS75xBqHpQJtXA",
# @consumer=#<OAuth::Consumer:0x007fb3fdc778e8 @key="WuKE6luZZUm3BD0lgSjbQ",
# @secret="cAZYhshxlGOywqK2GnNu9XmCoXxP5FyiARp0jw4hp8",
# @options={:signature_method=>"HMAC-SHA1",
# :request_token_path=>"/oauth/request_token",
# :authorize_path=>"/oauth/authorize",
# :access_token_path=>"/oauth/access_token", :proxy=>nil, :scheme=>:header,
# :http_method=>:post, :oauth_version=>"1.0", :site=>"https://api.twitter.com"},
# @http_method=:post, @http=#<Net::HTTP api.twitter.com:443 open=false>>,
# @params={:oauth_token=>"36882967-CCYJFHQ9LltmQXeOLa8STx9hlkFBpgF9i3ir0TrS5",
# "oauth_token"=>"36882967-CCYJFHQ9LltmQXeOLa8STx9hlkFBpgF9i3ir0TrS5",
# :oauth_token_secret=>"G3NytPrnVMlOsr99DDhNX1t0CkeS75xBqHpQJtXA",
# "oauth_token_secret"=>"G3NytPrnVMlOsr99DDhNX1t0CkeS75xBqHpQJtXA",
# :user_id=>"36882967", "user_id"=>"36882967", :screen_name=>"Syn_Splendidus",
# "screen_name"=>"Syn_Splendidus"}> # NoMethodError - undefined method `id' 
# for #<OAuth::AccessToken:0x007fb3fde5c500>:

