require_relative "./spec_helper_lite"
require_relative_to_root "app/domain_modules/convert_keys_to_symbol"

describe ConvertKeysToSymbol do
  it "converts keys of a hash to symbol" do
    hash = { "food" => 10, "grocery" => 20 }
    result_hash = ConvertKeysToSymbol.convert(hash)
    result_hash.should == { :food => 10, :grocery => 20 }
  end
end
