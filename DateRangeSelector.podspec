Pod::Spec.new do |s|
  # Version
  s.version       = "1.0.1"
  s.swift_version = "5.5"

  # Meta
  s.name         = "DateRangeSelector"
  s.summary      = "Customizable calendar view as a date range selector"
  s.homepage     = "https://github.com/webMiner44/DateRangeSelector"
  s.license      = { :type => "MIT" }
  s.author       = { "Vyacheslav Razumeenko" => "dnc.slava.razumeenko@gmail.com" }
  s.description  = <<-DESC
                    Customizable calendar view as a date range selector
                   DESC

  # Compatibility & Sources
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/webMiner44/DateRangeSelector.git", :tag => s.version.to_s }
  s.screenshots  = "https://user-images.githubusercontent.com/35375629/110629989-115ade00-81ba-11eb-85af-f6d5f026066c.png"
  s.source_files = "DateRangeSelector/**/*.{swift,xib}"
end