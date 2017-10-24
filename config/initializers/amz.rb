CarrierWave.configure do |config|
   config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     "AKIAJEM2LZXNA2GPJLPQ ",
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
