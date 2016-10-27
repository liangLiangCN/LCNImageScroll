Pod::Spec.new do |s|
s.name          = "LCNImageScroll"
s.version       = "0.0.3"
s.summary       = "图片轮播器"
s.homepage      = "https://github.com/liangLiangCN/LCNImageScroll"
s.license       = "MIT"
s.author        = { "LCN" => "https://github.com/liangLiangCN" }
s.platform      = :ios, "8.0"
s.source        = { :git => "https://github.com/liangLiangCN/LCNImageScroll.git", :tag => "0.0.3" }
s.source_files  = "LCNImageScrollDemo/LCNImageScroll/*.{h,m}"
s.frameworks    = "Foundation"
s.requires_arc  = true

end
