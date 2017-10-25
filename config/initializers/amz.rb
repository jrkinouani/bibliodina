CarrierWave.configure do |config|
   config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     "AKIAIUQP6ABRXJBSTR4A",
      aws_secret_access_key: '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',
      region:                'us-east-1',
      host:                  's3.amazonaws.com'

    }

    config.fog_directory  = 'websitebiblio'
    config.fog_public     = false
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end

  ##########################################
  # /!\ Temporary patch
  # disable CA-certificate check on Mac OSX
  ##########################################
    require 'excon'
  Excon.ssl_verify_peer = false
