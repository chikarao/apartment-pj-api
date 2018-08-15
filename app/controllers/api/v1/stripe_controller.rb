# REFERENCE: https://qiita.com/maecho/items/8cb3f9157940286f5656
# app/controllers/stripe_controller.rb
# NEED to save customer id in user table
require 'uri'
require 'net/http'
require 'json'

class Api::V1::StripeController < ApplicationController
  # protect_from_forgery with: :null_session

  before_action :valid_token, only: [:new_customer, :retrieve_customer, :update_card_info, :delete_card, :add_card, :update_customer, :make_payment, :new_subscription, :get_user_credentials ]

  def retrieve_customer
    # client = params[:client]
    # customer = Stripe::Customer.retrieve(client)
    # customer = Stripe::Customer.retrieve("cus_DM3bso7701GR57")
    # retrieve takes the customer id
    customer_id = @user.stripe_customer_id
    customer = Stripe::Customer.retrieve(customer_id)
    # source = Stripe::Source.retrieve(customer_id)

    json_response "Retrieved customer successfully", true, {customer: customer}, :ok
  end

  def update_card_info
    # will not take currenty
    update_columns_array = [:exp_month, :exp_year, :name, :address_line1, :address_line2, :address_city, :address_state, :address_zip, :address_country]

    customer_id = @user.stripe_customer_id
    # token = params[:stripeToken]
    # client needs to be the customer id
    # client = params[:client]
    card_id = params[:cardId]
    # exp_year = params[:exp_year]
    # exp_month = params[:exp_month]
    p "in update_card_info, card_id: " + card_id.to_s
    # p "in update_card_info, exp_year: " + exp_year.to_s
    # p "in update_card_info, exp_month: " + exp_month.to_s

    customer = Stripe::Customer.retrieve(customer_id)
    card = customer.sources.retrieve(card_id)
    # if exp_year
    #   card.exp_year = exp_year
    # end
    # if exp_month
    #   card.exp_month = exp_month
    # end
    update_columns_array.each do |column|
      if params[column]
        card[column] = params[column]
      end
    end
    card.save
    customer.save

    json_response "Updated card info for customer successfully", true, {customer: customer, user: @user}, :ok
  end

  def delete_card
    customer_id = @user.stripe_customer_id

    card_id = params[:cardId]

    customer = Stripe::Customer.retrieve(customer_id)
    card = customer.sources.retrieve(card_id).delete
    customer.save

    json_response "Deleted card for customer successfully", true, {customer: customer, user: @user}, :ok
  end

  def add_card
    customer_id = @user.stripe_customer_id

    token = params[:stripeToken]

    customer = Stripe::Customer.retrieve(customer_id)
    card = customer.sources.create(source: token)
    customer.save

    json_response "Created card for customer successfully", true, {customer: customer, user: @user}, :ok
  end

  def update_customer
    customer_id = @user.stripe_customer_id
    card_id = params[:cardId]
    # p "in update_card_info, card_id: " + card_id.to_s
    # p "in update_card_info, exp_year: " + exp_year.to_s

    customer = Stripe::Customer.retrieve(customer_id)
    p "in update_card_info, card_id: " + card_id.to_s
    p "in update_card_info, customer: " + customer.to_s

    if card_id
      customer.default_source = card_id
      if customer.save
        json_response "Updated customer successfully", true, {customer: customer, user: @user}, :ok
      else
        json_response "Create customer failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Create customer failed", false, {}, :unprocessable_entity
    end
  end

  def get_user_credentials
    # reference: https://stripe.com/docs/connect/standard-accounts
    secret_key = ENV["STRIPE_SECRET_KEY"]
    authorization_code = params[:code]
    grant_type = params[:grant_type]

    # p "in get_user_credentials: " + secret_key
    # p "params[:code]: " + params[:code].to_s
    # p "params[:grant_type]: " + params[:grant_type].to_s
    # p "grant_type: " + grant_type.to_s
    # p "authorization_code: " + authorization_code.to_s
    # p "User.column_names: " + User.column_names.to_s

    # url = URI("https://jsonplaceholder.typicode.com/todos/1")
    url = URI.parse("https://jsonplaceholder.typicode.com/todos/1")
    # url = URI.parse(  "https://connect.stripe.com/oauth/token/client_secret=#{secret_key}&code=#{authorization_code}&grant_type=#{grant_type}")

    response = Net::HTTP.get(url)

    parsedResponse = JSON.parse(response)

    puts "parsedResponse" + parsedResponse.to_s

    client_id = parsedResponse["title"]
    # client_id = parsedResponse["code"]
    # if parsedResponse.error
      # json_response "Get user credentials failed. There was an error in the response from Stripe", false, {error: parsedResponse.error}, :unprocessable_entity
    # else
      if client_id
        #change this to = client_id in production
        @user.swipe_customer_id = nil
        if @user.save
          json_response "Obtained user credentials successfully", true, {client_id: client_id}, :ok
        else
          json_response "Could not save client_id to user", false, {}, :unprocessable_entity
        end
      else
        json_response "Could not get client_id", false, {}, :unprocessable_entity
      end
    # end
  end

  def new_customer
    token = params[:stripeToken]
    # params client is email string
    client = params[:client]
    # details of client informaiton
    detail = params[:detail]

    p "in new_customer, token: " + token.to_s
    p "in new_customer, client: " + client.to_s

    customer = Stripe::Customer.create(
      :email => client,
      :source => token,
      :description => detail
    )

    @user.stripe_customer_id = customer.id

    if @user.save
      user_serializer = parse_json @user
      json_response "Created swipe new customer successfully", true, {customer: customer, user: user_serializer}, :ok
    else
      json_response "Create customer failed", false, {}, :unprocessable_entity
    end
  end

  def make_payment
    customer_id = @user.stripe_customer_id
    receipt_email = @user.email

    amount = params[:amount]
    currency = params[:currency]
    description = params[:description]

    customer = Stripe::Customer.retrieve(customer_id)
    card_id = customer.default_source

    charge = Stripe::Charge.create(
      amount: amount,
      currency: currency,
      source: card_id,
      customer: customer_id,
      description: description,
      receipt_email: receipt_email
    )

    if charge.paid
      json_response "Processed charge for customer successfully", true, {charge: charge}, :ok
    else
      json_response "Payment process failed", false, {}, :unprocessable_entity
    end
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

private

def valid_token
  @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
  if @user
    return @user
  else
    json_response "Invalid token", false, {}, :failure
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
