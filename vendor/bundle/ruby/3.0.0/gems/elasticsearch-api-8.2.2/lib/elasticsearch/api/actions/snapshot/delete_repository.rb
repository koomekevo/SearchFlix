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

module Elasticsearch
  module API
    module Snapshot
      module Actions
        # Deletes a repository.
        #
        # @option arguments [List] :repository Name of the snapshot repository to unregister. Wildcard (`*`) patterns are supported.
        # @option arguments [Time] :master_timeout Explicit operation timeout for connection to master node
        # @option arguments [Time] :timeout Explicit operation timeout
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/8.2/modules-snapshots.html
        #
        def delete_repository(arguments = {})
          raise ArgumentError, "Required argument 'repository' missing" unless arguments[:repository]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _repository = arguments.delete(:repository)

          method = Elasticsearch::API::HTTP_DELETE
          path   = "_snapshot/#{Utils.__listify(_repository)}"
          params = Utils.process_params(arguments)

          if Array(arguments[:ignore]).include?(404)
            Utils.__rescue_from_not_found {
              Elasticsearch::API::Response.new(
                perform_request(method, path, params, body, headers)
              )
            }
          else
            Elasticsearch::API::Response.new(
              perform_request(method, path, params, body, headers)
            )
          end
        end
      end
    end
  end
end