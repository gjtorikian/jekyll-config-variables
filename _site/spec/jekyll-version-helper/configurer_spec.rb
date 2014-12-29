require 'spec_helper'

describe('Configurer') do
  let(:file1)        { setup_doc('file1.md') }
  let(:file2)        { setup_doc('file2.md') }

  it "writes the default frontmatter using a variable" do
    require 'pp'
    pp file1
    expect(1).to eql(3)
  end
end
