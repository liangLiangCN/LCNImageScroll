Pod::Spec.new do |s|
    s.name         = "LCNImageScroll"
    s.version      = "0.0.2"
    s.summary      = "图片轮播器"
    s.homepage     = "https://github.com/liangLiangCN/LCNImageScroll"
    s.license      = "MIT"
    s.author       =  { "梁梁" => "liangLiang_614@163.com" }
    s.platform     = :ios, "8.0"
    s.source       = { :git => "https://github.com/liangLiangCN/LCNImageScroll.git", :tag => "0.0.2" }
    s.source_files  = "LCNImageScrollDemo/LCNImageScroll/*.{h,m}"
    s.requires_arc = true
end
