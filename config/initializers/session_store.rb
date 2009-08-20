# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Skola_session',
  :secret      => '3806a4fea4171a6b226a593371ede852bd368a409fa5e9963c78c1d737325cc87ccbc7af1da8cd02544ab550faa4826dfa713d1553ea98b9185b226a9159f312'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
