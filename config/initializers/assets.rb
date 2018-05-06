Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.digest = true
Rails.application.config.assets.precompile += %w(*.svg *.eot *.woff *.ttf *.woff2 *.png)

NonStupidDigestAssets.whitelist += [/.(?i:)(?:svg|eot|woff|ttf|woff2|png)$/]
