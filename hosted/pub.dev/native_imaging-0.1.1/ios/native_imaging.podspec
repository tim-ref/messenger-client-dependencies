#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint native_imaging.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'native_imaging'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*', 'src/*.{h,c}', 'src/ios/*.{h,c}', 'src/blurhash/*.{h,c}', 'src/libjpeg-turbo/cdjpeg.c', 'src/libjpeg-turbo/jaricom.c', 'src/libjpeg-turbo/jcapimin.c', 'src/libjpeg-turbo/jcapistd.c', 'src/libjpeg-turbo/jcarith.c', 'src/libjpeg-turbo/jccoefct.c', 'src/libjpeg-turbo/jccolor.c', 'src/libjpeg-turbo/jcdctmgr.c', 'src/libjpeg-turbo/jchuff.c', 'src/libjpeg-turbo/jcicc.c', 'src/libjpeg-turbo/jcinit.c', 'src/libjpeg-turbo/jcmainct.c', 'src/libjpeg-turbo/jcmarker.c', 'src/libjpeg-turbo/jcmaster.c', 'src/libjpeg-turbo/jcomapi.c', 'src/libjpeg-turbo/jcparam.c', 'src/libjpeg-turbo/jcphuff.c', 'src/libjpeg-turbo/jcprepct.c', 'src/libjpeg-turbo/jcsample.c', 'src/libjpeg-turbo/jctrans.c', 'src/libjpeg-turbo/jdapimin.c', 'src/libjpeg-turbo/jdapistd.c', 'src/libjpeg-turbo/jdarith.c', 'src/libjpeg-turbo/jdatadst.c', 'src/libjpeg-turbo/jdatadst-tj.c', 'src/libjpeg-turbo/jdatasrc.c', 'src/libjpeg-turbo/jdatasrc-tj.c', 'src/libjpeg-turbo/jdcoefct.c', 'src/libjpeg-turbo/jdcolor.c', 'src/libjpeg-turbo/jddctmgr.c', 'src/libjpeg-turbo/jdhuff.c', 'src/libjpeg-turbo/jdicc.c', 'src/libjpeg-turbo/jdinput.c', 'src/libjpeg-turbo/jdmainct.c', 'src/libjpeg-turbo/jdmarker.c', 'src/libjpeg-turbo/jdmaster.c', 'src/libjpeg-turbo/jdmerge.c', 'src/libjpeg-turbo/jdphuff.c', 'src/libjpeg-turbo/jdpostct.c', 'src/libjpeg-turbo/jdsample.c', 'src/libjpeg-turbo/jdtrans.c', 'src/libjpeg-turbo/jerror.c', 'src/libjpeg-turbo/jfdctflt.c', 'src/libjpeg-turbo/jfdctfst.c', 'src/libjpeg-turbo/jfdctint.c', 'src/libjpeg-turbo/jidctflt.c', 'src/libjpeg-turbo/jidctfst.c', 'src/libjpeg-turbo/jidctint.c', 'src/libjpeg-turbo/jidctred.c', 'src/libjpeg-turbo/jmemmgr.c', 'src/libjpeg-turbo/jmemnobs.c', 'src/libjpeg-turbo/jquant1.c', 'src/libjpeg-turbo/jquant2.c', 'src/libjpeg-turbo/jsimd_none.c', 'src/libjpeg-turbo/jutils.c', 'src/libjpeg-turbo/rdbmp.c', 'src/libjpeg-turbo/rdcolmap.c', 'src/libjpeg-turbo/rdppm.c', 'src/libjpeg-turbo/rdswitch.c', 'src/libjpeg-turbo/tjutil.c', 'src/libjpeg-turbo/transupp.c', 'src/libjpeg-turbo/turbojpeg.c', 'src/libjpeg-turbo/wrbmp.c', 'src/libjpeg-turbo/wrppm.c'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => "#{File.join(File.dirname(__FILE__), 'src/blurhash')} #{File.join(File.dirname(__FILE__), 'src/libjpeg-turbo')}" }
  s.compiler_flags = '-DJPEG_ENCODE', '-DBMP_SUPPORTED', '-DPPM_SUPPORTED'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
