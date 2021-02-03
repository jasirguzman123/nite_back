json.data do
  json.token @token
  json.name @user.full_name
  json.email @user.email
  json.phone @user.phone
  json.birthdate @user.birthdate
end
