# REFERENCE: https://qiita.com/maecho/items/8cb3f9157940286f5656
# app/controllers/stripe_controller.rb
# NEED to save customer id in user table
class Api::V1::StripeController < ApplicationController
  # protect_from_forgery with: :null_session

  def retrieve_customer
    client = params[:client]
    # customer = Stripe::Customer.retrieve(client)
    customer = Stripe::Customer.retrieve("cus_DM3bso7701GR57")
    json_response "Retrieved customer successfully", true, {customer: customer}, :ok
  end

  def update_card_info
    token = params[:stripeToken]
    # client needs to be the customer id
    client = params[:client]
    # get_customer = Stripe::Customer.retrieve(client)
    # customer id for test@test.com
    customer = Stripe::Customer.retrieve("cus_DM3bso7701GR57")
    customer.source = token
    customer.save

    json_response "Updated card info for customer successfully", true, {customer: customer}, :ok
  end

  def new_customer
    token = params[:stripeToken]
    client = params[:client]
    # details of client informaiton
    detail = params[:detail]

    customer = Stripe::Customer.create(
      :email => client,
      :source => token,
      :description => detail
    )
    json_response "Created swipe new customer successfully", true, {customer: customer}, :ok
  end

  def new_subscription
    # get params stripe token
    token = params[:stripeToken]
    # get client infor such as email
    client = params[:client]
    # details of client informaiton
    detail = params[:detail]
    # plan to sign up to
    plan = params[:plan]

    # create customer
    customer = Stripe::Customer.create(
      :email => client,
      :source => token,
      :description => detail
    )

    # p "in stripe controller, customer: " + customer.to_s

    # get id of customer !! need to persist to db user
    customer_id = customer.id

    #just a test .save saves data on stripe
    # token received from api initially is the credit card info
    # token can be used to update card info of customer with source
    # get_customer = Stripe::Customer.retrieve("cus_DM3bso7701GR57")
    # get_customer.email = "testtest@test.com"
    # get_customer.email = "testtest@test.com"
    # get_customer.save

    # Subsctiption create
    subscription = Stripe::Subscription.create(
     customer: customer_id,
     plan: plan
    )

    # charge = Stripe::Charge.create({
    # amount: 999,
    # currency: 'usd',
    # description: 'Example charge',
    # source: token,
    # })

    p "in stripe controller, subscription: " + subscription.to_s

    # conversation_serializer = parse_json conversation
    json_response "Created swipe subscription successfully", true, {subscription: subscription, customer: customer, get_customer: get_customer}, :ok


  end
end

# FOR switching plans
# customer = Stripe::Customer.retrieve(CUSTOMER_ID)
#
# # get current subscription
# subscription = Stripe::Subscription.retrieve(customer.subscriptions.data[0].id)
# # get current subscription
# item_id = subscription.items.data[0].id

# # get new item
# items =[{
#   id: item_id,
#   plan: plan_id
#   }]
# # update subscription
# subscription.items = items
# subscription.save
