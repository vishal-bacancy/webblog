Rails.configuration.stripe = {
    :publishable_key => "pk_test_p4wjpQt3NKNnCv1O9uzJ4lzF",
    :secret_key      => "sk_test_SqOO4lRnhvq3jQIpL8dVlbNk"
}

Stripe.api_key = Rails.application.secrets.stripe_secret_key