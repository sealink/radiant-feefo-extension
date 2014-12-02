namespace :radiant do
  namespace :extensions do
    namespace :feefo do
      desc "Copies public assets of the extension to the instance public/ directory."
      task :update => :environment do
        RadiantExtensionHelper.copy_assets(:quicktravel_config)
      end
    end
  end
end