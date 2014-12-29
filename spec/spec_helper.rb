require 'jekyll'
require 'yaml'
require File.expand_path('lib/jekyll-config-variables.rb')

RSpec.configure do |config|

  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    Jekyll.logger.log_level = :error

    @fixtures_path = Pathname.new(__FILE__).parent.join('fixtures')
    @dest        = @fixtures_path.join('_site')
    @config_src  = @fixtures_path.join('_config.yml')
    @posts_src   = @fixtures_path.join('_posts')
    @layouts_src = @fixtures_path.join('_layouts')
    @plugins_src = @fixtures_path.join('_plugins')

    @site = Jekyll::Site.new(Jekyll.configuration(
      'source'      => @fixtures_path.to_s,
      'destination' => @dest.to_s,
      'plugins'     => @plugins_src.to_s,
      'collections' => {
        'source' => {'output' => true}
      }
    ))

    @dest.rmtree if @dest.exist?
    @site.process
  end

  # config.after(:each) do
  #   @dest.rmtree if @dest.exist?
  # end

  def setup_doc(doc_filename)
    @site.collections['source'].docs.find { |d| d.relative_path.match(doc_filename) }
  end

  def destination_file_exists?(file)
    File.exist?(File.join(@dest.to_s, file))
  end
end
