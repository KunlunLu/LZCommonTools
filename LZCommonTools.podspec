
Pod::Spec.new do |s|

  s.name         = "LZCommonTools"
  s.version      = "0.0.1"
  s.summary      = "Make development easier."
  s.homepage     = "https://github.com/KunlunLu/LZCommonTools"
  s.license      = "MIT"
  s.author       = { "Kunlun Lu" => "641803397@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/KunlunLu/LZCommonTools.git", :tag => s.version }
  s.source_files  = "CommonTools", "CommonTools/**/*.{h,m}"
  s.framework  = "UIKit"
  s.requires_arc = true


end
