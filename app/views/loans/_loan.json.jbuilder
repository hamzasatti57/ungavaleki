json.extract! loan, :id, :description, :amount, :admin_approval, :plug_approval, :status, :created_at, :updated_at
json.url loan_url(loan, format: :json)
