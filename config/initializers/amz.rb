CarrierWave.configure do |config|
   config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     " AKIAJ72GRXKYPLX7ZQ7A ",
      aws_secret_access_key: '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',
      region:                'ap-south-1',
      host:                  's3-ap-south-1.amazonaws.com'

    }

    config.fog_directory  = 'bibliorunreunion'
    config.fog_public     = false
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end

  ##########################################
  # /!\ Temporary patch
  # disable CA-certificate check on Mac OSX
  ##########################################
    require 'excon'
  Excon.ssl_verify_peer = false
