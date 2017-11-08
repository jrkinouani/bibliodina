  #CarrierWave.configure do |config|
     #config.fog_provider = 'fog/aws'
      #config.fog_credentials = {
        #provider: 'AWS',
        #:s3_access_key_id      => ENV['S3_ACCESS_KEY'],                        # required
        #:s3_secret_access_key  => ENV['S3_SECRET_KEY'],
        #region:                'us-east-1',
      #  host:                  's3.amazonaws.com'
      ##}

      #config.fog_directory  = ENV['S3_Bucket']
      #config.fog_public     = false
      #config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  #  end

  ##########################################
  # /!\ Temporary patch
  # disable CA-certificate check on Mac OSX
  ##########################################
    #require 'excon'
  #Excon.ssl_verify_peer = false
