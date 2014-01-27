require_relative 'spec_helper'

describe PcURL::Request do

  before(:each) do
    @pcurl = PcURL::Request.new
  end

  it 'should pretty print a JSON response' do
    json = {
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

    @pcurl.stub(:get).and_return(json)
    @pcurl.request('http://some/test/url').should_not == json # pretty != unpretty
  end

  it 'should raise a useful error if the response is not valid JSON' do
    invalid_json = "({'something': 'invalid'})"

    @pcurl.stub(:get).and_return(invalid_json)
    expect { @pcurl.request('http://some/test/url') }.to raise_error
  end

end
