@customers = Customer.create(
  [
    {
      email: "customer1@test.com",
      password: "password"
    },
    {
      email: "customer2@test.com",
      password: "password"
    }
  ]
).each(&:confirm)

@agents = Agent.create(
  [
    {
      email: "agent1@test.com",
      password: "password"
    },
    {
      email: "agent2@test.com",
      password: "password"
    }
  ]
).each(&:confirm)

@admin = Admin.create(
  [
    {
      email: "admin1@test.com",
      password: "password"
    }
  ]
).each(&:confirm)

@support_requests = SupportRequest.create(
  [
    {subject: "request 1", customer: Customer.first, agent: Agent.first},
    {subject: "request 2", customer: Customer.first, agent: Agent.first}
  ]
)
