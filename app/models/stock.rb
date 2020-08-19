class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.iex_client[:sandbox_api_pkey],
        secret_token: Rails.application.credentials.iex_client[:sandbox_api_skey],
        endpoint: 'https://cloud.iexapis.com/v1'
    )
    #client.quote(ticker_symbol)
    #client.quote(ticker_symbol).latest_price
    begin
      new(ticker: ticker_symbol, name: client.quote(ticker_symbol).company_name, last_price: client.quote(ticker_symbol).latest_price)
    rescue => exception
      return nil
    end

  end
end
