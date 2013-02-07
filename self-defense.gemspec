Gem::Specification.new do |s|
  s.name = 'self-defense'
  s.version = '0.1.4'
  s.summary = 'self-defense'
    s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb'] 
  s.signing_key = '../privatekeys/self-defense.pem'
  s.cert_chain  = ['gem-public_cert.pem']
end
