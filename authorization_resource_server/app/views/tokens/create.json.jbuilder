json.oauth do
  json.access_token @new_token.token
  json.expires_in Token::EXPIRES_IN
end
