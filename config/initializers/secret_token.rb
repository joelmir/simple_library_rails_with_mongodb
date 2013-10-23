# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
LibraryMongo::Application.config.secret_key_base = 'fadd1770c35615613e51c62a4b02cc2697a6599d72bd46111cf13d1545fdb22a1d58cbc804e14fc4b14b74b8d556a6c56b79b4ad69893b6761c8fd527b5458a1'
