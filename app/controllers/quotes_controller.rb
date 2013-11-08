class QuotesController < Rulers::Controller

  def a_quote
    render :a_quote, :noun => :thinking
  end

  def quote_1
    quote_1 = Rulers::Model::FileModel.find(1)
    render :quote, :obj => quote_1, :user_agent => user_agent
  end

  def quote_2
    quote_2 = Rulers::Model::FileModel.find(2)
    render :quote, :obj => quote_2
  end

  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels",
      "attribution" => "Me"
    }
    user_agent = request.user_agent
    m = FileModel.create attrs
    render :quote, :obj => m, :user_agent => user_agent
  end

  def update
  end

  def show
    quote = FileModel.find(params["id"])
    user_agent = request.user_agent
    render_response :quote, :obj => quote, :user_agent => user_agent
  end

end