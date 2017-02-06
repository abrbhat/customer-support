json.(support_request,
  :id,
  :status,
  :severity,
  :created_at,
  :subject,
  :category,
  :description,
  :closed_at
)

json.customer support_request.customer.email
json.agent support_request.agent.email.split("@")[0]
