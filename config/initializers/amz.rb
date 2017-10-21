CarrierWave.configure do |config|
   config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     "  AKIAIEWLQ4BLQOPBWSBQ",
      aws_secret_access_key: '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',
      region:                'ap-southeast-2',
      host:                  's3-ap-southeast-2.amazonaws.com'

    }

    config.fog_directory  = 'caviarautonewserver'
    config.fog_public     = false
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end

  ##########################################
  # /!\ Temporary patch
  # disable CA-certificate check on Mac OSX
  ##########################################
    require 'excon'
  Excon.ssl_verify_peer = false 
