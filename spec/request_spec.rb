require_relative 'spec_helper'

describe PcURL::Request do

  before(:each) do
    @json = {
        'menu' => {
            'id' => 'file',
            'value' => 'File',
            'popup' => {
                'menuitem' => [
                    {'value' => 'New', 'onclick' => 'CreateNewDoc()'},
                    {'value' => 'Open', 'onclick' => 'OpenDoc()'},
                    {'value' => 'Close', 'onclick' => 'CloseDoc()'}
                ]
            }
        }
    }.to_json

    @pcurl = PcURL::Request.new
    @pcurl.stub(:get).and_return(@json)
  end

  it 'should pretty print a JSON response' do
    @pcurl.get('http://some/test/url').should == @json
  end

end
