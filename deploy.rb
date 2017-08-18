require 'aws-sdk'

credentials = Aws::SharedCredentials.new(profile_name: ENV['AWS_CREDENTIALS_PROFILE'] || 'sean')

client = Aws::S3::Client.new(credentials: credentials, region: ENV['AWS_REGION'] || 'us-east-1')

bucket = ENV['S3_BUCKET'] || 'casieandseangotohawaii.com'

client.create_bucket(bucket: bucket)

client.put_bucket_acl({
  acl: 'public-read',
  bucket: bucket
})

Dir[File.join(__dir__, '**', '*.{css,html,ico,jpg,js,png,svg}')].each do |file|
  object_key = file.split(__dir__).last.sub(/^\//, '')

  puts "Uploading #{object_key}"

  client.put_object({
    bucket: bucket,
    key: object_key,
    body: File.read(file)
  })

  client.put_object_acl({
    acl: 'public-read',
    bucket: bucket,
    key: object_key
  })
end
