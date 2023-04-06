# frozen_string_literal: true

control 'cloud_credential' do
  title 'Verify F5 Distributed Cloud credential exists'
  impact 1.0

  name = input('output_cloud_credential')
  f5_xc_api_url = input('input_f5_xc_api_url')
  f5_xc_api_token = input('input_f5_xc_api_token')

  describe http("#{f5_xc_api_url}/config/namespaces/system/cloud_credentialss/#{name}",
                headers: { 'Authorization' => "APIToken #{f5_xc_api_token}" }) do
    its('status') { should eq 200 }
  end
end
