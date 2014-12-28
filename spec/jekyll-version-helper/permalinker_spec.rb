require 'spec_helper'

describe('Permalinker') do
  let(:index)        { setup_doc('index.html') }
  let(:file1)        { setup_doc('file1.md') }
  let(:file2)        { setup_doc('file2.md') }

  it 'properly moves files to where they need to go' do
    expect(destination_file_exists?('output/2.0/index.html')).to be_truthy
    expect(destination_file_exists?('output/2.0/page1/index.html')).to be_truthy
    expect(destination_file_exists?('output/2.0/folder/index.html')).to be_truthy
    expect(destination_file_exists?('output/2.0/folder/file1/index.html')).to be_truthy
    expect(destination_file_exists?('output/2.0/folder/file2/index.html')).to be_truthy
    expect(destination_file_exists?('output/2.0/folder/search/search.html')).to be_truthy
  end
end
