require 'spec_helper'

describe 'serverbackup_cdp_agent' do
    # set default OS
    let(:facts) { {:operatingsystem => 'centos'} }

    it { should contain_class('serverbackup_cdp_agent::packages') }
    it { should contain_exec('get-module') }
    it { should contain_service('cdp-agent') }

    context 'with $key => mykey' do
        let(:params) { {:key => 'mykey'} }
        it { should have_serverbackup_cdp_agent__key_resource_count(1) }
        it { should have_serverbackup_cdp_agent__get_key_resource_count(0) }
    end

    context 'with $key_server => 1.2.3.4' do
        let(:params) { {:key_server => '1.2.3.4'} }
        it { should have_serverbackup_cdp_agent__key_resource_count(0) }
        it { should have_serverbackup_cdp_agent__get_key_resource_count(1) }
    end
end