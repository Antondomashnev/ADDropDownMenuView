Pod::Spec.new do |s|
  s.name         = "ADDropDownMenuView"
  s.version      = "1.0.0"
  s.summary      = "ADDropDownMenuView is an iOS navigation drop down style view."
  s.description  = <<-DESC
                    ADDropDownMenuView is an iOS navigation drop down style view.
                   DESC
  s.homepage     = "https://github.com/Antondomashnev"
  s.author       = { 'Anton Domashnev' => 'antondomashnev@gmail.com' }
  s.source       = { :git => "https://github.com/Antondomashnev/ADDropDownMenuView.git", :tag => s.version.to_s}
  s.platform     = :ios
  s.source_files = 'ADDropDownMenu/*.{h,m}'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.requires_arc = true
end