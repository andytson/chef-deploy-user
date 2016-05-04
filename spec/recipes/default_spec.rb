describe 'deploy-user::default' do
  context 'with users databag containing a deploy user' do
    let(:chef_run) do
      users = {}
      users['deploy'] = {
        'username' => 'deploy',
        'groups' => ['deploy']
      }

      stub_data_bag('users').and_return(users.keys)
      users.each { |item, user| allow(Chef::EncryptedDataBagItem).to receive(:load).with('users', item).and_return(user) }

      ChefSpec::SoloRunner.new do |node|
        node.set['capistrano']['known_hosts'] = ['github.com', 'example.org']
      end.converge(described_recipe)
    end

    it 'will manage deploy user accounts' do
      expect(chef_run).to create_user('deploy').with(
        gid: 'deploy'
      )
      expect(chef_run).to create_group('deploy')
    end

    it 'will supply known_hosts files for user accounts' do
      expect(chef_run).to append_to_ssh_known_hosts 'github.com'
      expect(chef_run).to append_to_ssh_known_hosts 'example.org'
    end
  end
end
