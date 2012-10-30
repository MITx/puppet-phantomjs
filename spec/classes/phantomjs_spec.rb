require 'spec_helper'

describe "phantomjs" do
    describe "with default version" do
        describe "on amd64" do
            let(:facts) { { :architecture => 'amd64' } }
            it { should contain_exec('download-phantomjs-1.5.0-linux-x86_64-dynamic.tar.gz')}
        end
        describe "on x86_64" do
            let(:facts) { { :architecture => 'x86_64' } }
            it { should contain_exec('download-phantomjs-1.5.0-linux-x86_64-dynamic.tar.gz')}
        end

        describe "on 32 bit" do
            let(:facts) { { :architecture => 'x86' } }
            it { should contain_exec('download-phantomjs-1.5.0-linux-x86-dynamic.tar.gz')}
        end
    end

    describe "with version 1.6.0" do
        let(:params) { {:version => '1.6.0'} }
        describe "on amd64" do
            let(:facts) { { :architecture => 'amd64' } }
            it { should contain_exec('download-phantomjs-1.6.0-linux-x86_64-dynamic.tar.bz2')}
        end
        describe "on x86_64" do
            let(:facts) { { :architecture => 'x86_64' } }
            it { should contain_exec('download-phantomjs-1.6.0-linux-x86_64-dynamic.tar.bz2')}
        end

        describe "on 32 bit" do
            let(:facts) { { :architecture => 'x86' } }
            it { should contain_exec('download-phantomjs-1.6.0-linux-i686-dynamic.tar.bz2')}
        end
    end

    describe "with version 1.6.1" do
        let(:params) { {:version => '1.6.1'} }
        describe "on amd64" do
            let(:facts) { { :architecture => 'amd64' } }
            it { should contain_exec('download-phantomjs-1.6.1-linux-x86_64-dynamic.tar.bz2')}
        end
        describe "on x86_64" do
            let(:facts) { { :architecture => 'x86_64' } }
            it { should contain_exec('download-phantomjs-1.6.1-linux-x86_64-dynamic.tar.bz2')}
        end

        describe "on 32 bit" do
            let(:facts) { { :architecture => 'x86' } }
            it { should contain_exec('download-phantomjs-1.6.1-linux-i686-dynamic.tar.bz2')}
        end
    end

    describe "with version 1.7.0" do
        let(:params) { {:version => '1.7.0'} }
        describe "on amd64" do
            let(:facts) { { :architecture => 'amd64' } }
            it { should contain_exec('download-phantomjs-1.7.0-linux-x86_64.tar.bz2')}
        end
        describe "on x86_64" do
            let(:facts) { { :architecture => 'x86_64' } }
            it { should contain_exec('download-phantomjs-1.7.0-linux-x86_64.tar.bz2')}
        end

        describe "on 32 bit" do
            let(:facts) { { :architecture => 'x86' } }
            it { should contain_exec('download-phantomjs-1.7.0-linux-i686.tar.bz2')}
        end
    end
end