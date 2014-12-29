require 'spec_helper'

describe('Configurer') do
  let(:index)        { setup_doc('index.html') }
  let(:file1)        { setup_doc('file1.md') }
  let(:file2)        { setup_doc('file2.md') }

  it 'writes the default frontmatter using a variable' do
    expect(file1.data['version']).to eql('2.0')
    expect(file2.data['version']).to eql('2.0')
    expect(index.data['version']).to eql('2.0')
  end
end
