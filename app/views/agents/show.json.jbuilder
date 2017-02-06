json.partial! 'user', user: @agent

json.support_requests @agent.support_requests.sort.reverse,
                      partial: 'support_request',
                      as: :support_request
