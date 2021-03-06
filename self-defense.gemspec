Gem::Specification.new do |s|
  s.name = 'self-defense'
  s.version = '0.1.5'
  s.summary = 'self-defense'
    s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb'] 
  s.signing_key = '../privatekeys/self-defense.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/self-defense'
end
