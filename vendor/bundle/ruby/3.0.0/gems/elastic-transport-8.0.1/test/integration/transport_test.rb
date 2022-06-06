# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require 'test_helper'

class Elastic::Transport::ClientIntegrationTest < Minitest::Test
  context "Transport" do
    setup do
      begin; Object.send(:remove_const, :Patron);   rescue NameError; end
      uri = URI(HOST)
      @host = {
        host: uri.host,
        port: uri.port,
        user: uri.user,
        password: uri.password
      }
    end

    should "allow to customize the Faraday adapter to Typhoeus" do
      require 'typhoeus'
      require 'typhoeus/adapters/faraday'

      transport = Elastic::Transport::Transport::HTTP::Faraday.new(hosts: [@host]) do |f|
        f.response :logger
        f.adapter  :typhoeus
      end

      client = Elastic::Transport::Client.new(transport: transport)
      client.perform_request 'GET', ''
    end unless jruby?

    should "allow to customize the Faraday adapter to NetHttpPersistent" do
      require 'net/http/persistent'

      transport = Elastic::Transport::Transport::HTTP::Faraday.new(hosts: [@host]) do |f|
        f.response :logger
        f.adapter  :net_http_persistent
      end

      client = Elastic::Transport::Client.new(transport: transport)
      client.perform_request 'GET', ''
    end

    should "allow to define connection parameters and pass them" do
      transport = Elastic::Transport::Transport::HTTP::Faraday.new(
        hosts: [@host],
        options: { transport_options: { params: { format: 'yaml' } } }
      )

      client = Elastic::Transport::Client.new transport: transport
      response = client.perform_request 'GET', ''

      assert response.body.start_with?("---\n"), "Response body should be YAML: #{response.body.inspect}"
    end

    should "use the Curb client" do
      require 'curb'
      require 'elastic/transport/transport/http/curb'

      transport = Elastic::Transport::Transport::HTTP::Curb.new(hosts: [@host]) do |curl|
        curl.verbose = true
      end

      client = Elastic::Transport::Client.new(transport: transport)
      client.perform_request 'GET', ''
    end unless JRUBY

    should "deserialize JSON responses in the Curb client" do
      require 'curb'
      require 'elastic/transport/transport/http/curb'

      transport = Elastic::Transport::Transport::HTTP::Curb.new(hosts: [@host]) do |curl|
        curl.verbose = true
      end

      client = Elastic::Transport::Client.new(transport: transport)
      response = client.perform_request 'GET', ''

      assert_respond_to(response.body, :to_hash)
      assert_not_nil response.body['name']
      assert_equal 'application/json', response.headers['content-type']
    end unless jruby?
  end
end
