@customers = Customer.create(
  [
    {
      email: "user1@test.com",
      password: "password"
    }
  ]
).each(&:confirm)

@support_requests = SupportRequest.create(
  [
    {subject: "request 1", user: Customer.first},
    {subject: "request 2", user: Customer.first}
  ]
)
